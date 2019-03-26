library(styler)


### Name: parse_roxygen
### Title: Parse roxygen comments into text
### Aliases: parse_roxygen
### Keywords: internal

### ** Examples

styler:::parse_roxygen(c(
  "#' @examples",
  "#' 1+  1"
))
styler:::parse_roxygen(c(
  "#' @examples 33",
  "#'1+  1"
))



