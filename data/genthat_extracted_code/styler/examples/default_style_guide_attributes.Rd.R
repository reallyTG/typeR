library(styler)


### Name: default_style_guide_attributes
### Title: Initialize default style guide attributes
### Aliases: default_style_guide_attributes
### Keywords: internal

### ** Examples

string_to_format <- "call( 3)"
pd <- styler:::compute_parse_data_nested(string_to_format)
styler:::pre_visit(pd, c(default_style_guide_attributes))



