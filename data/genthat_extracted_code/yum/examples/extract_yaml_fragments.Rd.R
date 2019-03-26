library(yum)


### Name: extract_yaml_fragments
### Title: Extract all YAML fragments from a file
### Aliases: extract_yaml_fragments

### ** Examples

extract_yaml_fragments(text="
---
First: YAML fragment
  id: firstFragment
---
Outside of YAML
---
Second: YAML fragment
  id: secondFragment
  parentId: firstFragment
---
Also outside of YAML
");



