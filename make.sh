#!/bin/sh

# Array of use case paths
use_cases=(
    "integrations/zapier"
    "integrations/klamp"
    "resources/security"
    "resources/on-prem-deployment"
)

# Loop through each use case and create the file
for path in "${use_cases[@]}"; do
  # Create directory if it doesn't exist
  mkdir -p "$(dirname "$path")"

  # Create MDX file with a basic template
  cat <<EOF > "$path.mdx"
---
title: $(basename "$path" | sed 's/-/ /g' | sed 's/\b\(.\)/\u\1/g')
description: Description for $(basename "$path")
---

# $(basename "$path" | sed 's/-/ /g' | sed 's/\b\(.\)/\u\1/g')

Write your content here...
EOF
done
