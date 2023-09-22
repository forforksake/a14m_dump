
# Add Android SDK platform tools to path
if [ -d "$HOME/platform-tools" ] ; then
    PATH="$HOME/platform-tools:$PATH"
fi
alias apktool="java -jar $HOME/bin/apktool.jar"
export PATH="$HOME/jadx/bin:$PATH"

# Super-fast repo sync
repofastsync() { time schedtool -B -e ionice -n 0 `which repo` sync -c --force-sync --optimized-fetch --no-tags --no-clone-bundle --retry-fetches=5 -j$(nproc --all) "$@"; }

# List lib dependencies of any lib/bin
list_blob_deps() { readelf -d $1 | grep "\(NEEDED\)" | sed -r "s/.*\[(.*)\]/\1/"; }

# Add android sdk to path
cat <<'EOF' >> .profile

# Add Android SDK platform tools to path
if [ -d "$HOME/platform-tools" ] ; then
    PATH="$HOME/platform-tools:$PATH"
fi
