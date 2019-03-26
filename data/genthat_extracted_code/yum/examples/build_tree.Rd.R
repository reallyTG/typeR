library(yum)


### Name: build_tree
### Title: Convert the objects loaded from YAML fragments into a tree
### Aliases: build_tree

### ** Examples

loadedYum <- yum::load_yaml_fragments(text=c(
"---",
"-",
"  id: firstFragment",
"---",
"Outside of YAML",
"---",
"-",
"  id: secondFragment",
"  parentId: firstFragment",
"---",
"Also outside of YAML"));
yum::build_tree(loadedYum);



