library(styler)


### Name: is_code_chunk_header
### Title: Identify spinning code chunk header
### Aliases: is_code_chunk_header
### Keywords: internal

### ** Examples

style_text(c(
  "# title",
  "some_code <- function() {}",
  "#+ chunk-label, opt1=value1",
  "call(3, 2, c(3:2))"
))



