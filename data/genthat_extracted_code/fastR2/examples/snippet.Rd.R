library(fastR2)


### Name: snippet
### Title: Display or execute a snippet of R code
### Aliases: snippet
### Keywords: utilities

### ** Examples

snippet("normal01")
# prefix works
snippet("normal")
# this prefix is ambiguous
snippet("norm")
# sequence of "histogram" snippets
snippet("hist", eval = FALSE, echo = TRUE, view = FALSE)
# just one of the "histogram" snippets
snippet("histogram04", eval = FALSE, echo = TRUE, view = FALSE)
# Prefix too short, but a helpful message is displayed
snippet("h", eval = FALSE, echo = TRUE, view = FALSE)



