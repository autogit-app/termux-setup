#!/data/data/com.termux/files/usr/bin/bash
# AutoGit Termux setup.
# Run: curl -L https://raw.githubusercontent.com/autogit-app/termux-setup/refs/heads/main/setup.sh | bash

set -e
BASE="https://raw.githubusercontent.com/autogit-app/termux-setup/refs/heads/main"

echo "1. Installing git and python..."
pkg install -y git python

echo "2. Downloading server.py..."
curl -L -o "$HOME/server.py" "$BASE/server.py"

echo "3. Starting server..."
nohup python3 "$HOME/server.py" >> "$HOME/server.log" 2>&1 &

echo "4. Adding server to .bashrc (run on Termux open)..."
if grep -q 'server.py' "$HOME/.bashrc" 2>/dev/null; then
  echo "Already in .bashrc."
else
  echo '[ -f "$HOME/server.py" ] && nohup python3 "$HOME/server.py" >> "$HOME/server.log" 2>&1 &' >> "$HOME/.bashrc"
  echo "Done."
fi

echo "Setup complete. Open AutoGit and use Local Repositories."
