## ---- message = FALSE----------------------------------------------------
library("styler")
library("dplyr")
names(tidyverse_style())
str(tidyverse_style(), give.attr = FALSE, list.len = 3)

## ------------------------------------------------------------------------
tidyverse_style()$space$remove_space_after_opening_paren

## ------------------------------------------------------------------------
string_to_format <- "call( 3)"
pd <- styler:::compute_parse_data_nested(string_to_format) %>%
  styler:::pre_visit(c(default_style_guide_attributes))
pd$child[[1]] %>%
  select(token, terminal, text, newlines, spaces)

## ------------------------------------------------------------------------
styler:::remove_space_after_opening_paren(pd$child[[1]]) %>%
  select(token, terminal, text, newlines, spaces)

## ------------------------------------------------------------------------
all.equal(
  style_text(string_to_format, transformers = tidyverse_style(strict = FALSE)),
  style_text(string_to_format, style = tidyverse_style, strict = FALSE),
  style_text(string_to_format, strict = FALSE),
)

## ------------------------------------------------------------------------
space_after_opening_style <- function(are_you_sure) {
  create_style_guide(space = tibble::lst(remove_space_after_opening_paren = 
    if (are_you_sure) styler:::remove_space_after_opening_paren
  ))
}
style_text("call( 1,1)", style = space_after_opening_style, are_you_sure = FALSE)  

## ------------------------------------------------------------------------
style_text("call( 1,1)", style = space_after_opening_style, are_you_sure = TRUE)  

## ------------------------------------------------------------------------
styler:::apply_transformers

## ------------------------------------------------------------------------
add_one <- function(x) {
  x + 1
}

## ------------------------------------------------------------------------
add_one <- function(x) 
{
  x + 1
}

## ------------------------------------------------------------------------
code <- c("add_one <- function(x) { x + 1 }")

## ------------------------------------------------------------------------
pd <- styler:::compute_parse_data_nested(code)

## ------------------------------------------------------------------------
pd$child[[1]]$child[[3]]$child[[5]]

## ------------------------------------------------------------------------
set_line_break_before_curly_opening <- function(pd_flat) {
  op <- pd_flat$token %in% "'{'"
  pd_flat$lag_newlines[op] <- 1L
  pd_flat
}

## ------------------------------------------------------------------------
set_line_break_before_curly_opening_style <- function() {
  create_style_guide(line_break = lst(set_line_break_before_curly_opening))
}

## ------------------------------------------------------------------------
style_text(code, style = set_line_break_before_curly_opening_style)

## ---- eval = FALSE-------------------------------------------------------
#  a <- function() # comments should remain EOL
#  {
#    3
#  }

## ---- eval = FALSE-------------------------------------------------------
#  a <- function() # comments should remain EOL {
#    3
#  }

## ------------------------------------------------------------------------
styler:::remove_line_break_before_curly_opening

