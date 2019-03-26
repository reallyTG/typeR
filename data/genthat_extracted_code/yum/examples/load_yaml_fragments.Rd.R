library(yum)


### Name: load_yaml_fragments
### Title: Load all YAML fragments from a file
### Aliases: load_yaml_fragments

### ** Examples

yum::load_yaml_fragments(text="
---
-
  id: firstFragment
---
Outside of YAML
---
-
  id: secondFragment
  parentId: firstFragment
---
Also outside of YAML");




