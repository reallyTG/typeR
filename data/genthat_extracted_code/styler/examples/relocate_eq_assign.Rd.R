library(styler)


### Name: relocate_eq_assign
### Title: Relocate the expressions containing the token 'EQ_ASSIGN' within
###   the nested parse table
### Aliases: relocate_eq_assign
### Keywords: internal

### ** Examples

styler:::get_parse_data("a <- b <- 3")
styler:::get_parse_data("a  = b = 3")
styler:::get_parse_data(
  "x = 5
  if(x >= 5)
  y = TRUE else
  y = FALSE",
)
styler:::get_parse_data(
  "x <- 5
  if(x >= 5)
  y <- TRUE else
  y <- FALSE",
)



