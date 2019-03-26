library(styler)


### Name: create_node_from_nested_root
### Title: Convert a nested tibble into a node tree
### Aliases: create_node_from_nested_root
### Keywords: internal

### ** Examples

if (getRversion() >= 3.2) {
  code <- "a <- function(x) { if(x > 1) { 1+1 } else {x} }"
  nested_pd <- styler:::compute_parse_data_nested(code)
  initialized <- styler:::pre_visit(nested_pd, c(default_style_guide_attributes))
  styler:::create_node_from_nested_root(initialized, structure_only = FALSE)
}



