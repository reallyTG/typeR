library(styler)


### Name: create_style_guide
### Title: Create a style guide
### Aliases: create_style_guide

### ** Examples

set_line_break_before_curly_opening <- function(pd_flat) {
  op <- pd_flat$token %in% "'{'"
  pd_flat$lag_newlines[op] <- 1L
  pd_flat
}
set_line_break_before_curly_opening_style <- function() {
  create_style_guide(line_break = tibble::lst(set_line_break_before_curly_opening))
}
style_text("a <- function(x) { x }", style = set_line_break_before_curly_opening_style)



