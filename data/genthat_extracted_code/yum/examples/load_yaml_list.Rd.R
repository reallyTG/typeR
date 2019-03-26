library(yum)


### Name: load_yaml_list
### Title: Load all YAML fragments from all character vectors in a list
### Aliases: load_yaml_list

### ** Examples

yamlList <- list(c(
"---",
"-",
"  id: firstFragment",
"---"), c(
"---",
"-",
"  id: secondFragment",
"  parentId: firstFragment",
"---"));
yum::load_yaml_list(yamlList);



