library(yum)


### Name: load_and_simplify
### Title: Load YAML fragments in one or multiple files and simplify them
### Aliases: load_and_simplify load_and_simplify_dir

### ** Examples

yum::load_and_simplify(text="
---
firstObject:
  id: firstFragment
---
Outside of YAML
---
otherObjectType:
  -
    id: secondFragment
    parentId: firstFragment
  -
    id: thirdFragment
    parentId: firstFragment
---
Also outside of YAML");




