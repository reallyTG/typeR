library(gqlr)


### Name: parse_ast
### Title: Parse AST
### Aliases: parse_ast

### ** Examples

parse_date_value <- function(obj, schema) {
  as.Date(obj)
}
parse_ast("Date", parse_date_value)

# Example from Int scalar
parse_int <- function (value, ...) {
  MAX_INT <-  2147483647
  MIN_INT <- -2147483648
  num <- suppressWarnings(as.integer(value))
  if (!is.na(num)) {
    if (num <= MAX_INT && num >= MIN_INT) {
      return(num)
    }
  }
  return(NULL)
}
parse_ast("IntValue", parse_int)



