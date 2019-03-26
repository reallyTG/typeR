library(glue)


### Name: quoting
### Title: Quoting operators
### Aliases: quoting single_quote double_quote backtick

### ** Examples

x <- 1:5
glue('Values of x: {glue_collapse(backtick(x), sep = ", ", last = " and ")}')



