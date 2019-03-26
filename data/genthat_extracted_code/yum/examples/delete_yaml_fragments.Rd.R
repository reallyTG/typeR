library(yum)


### Name: delete_yaml_fragments
### Title: Delete all YAML fragments from a file
### Aliases: delete_yaml_fragments

### ** Examples

yum::delete_yaml_fragments(text=c("---", "First YAML fragment", "---",
                                   "Outside of YAML",
                                   "---", "Second fragment", "---",
                                   "Also outside of YAML"));




