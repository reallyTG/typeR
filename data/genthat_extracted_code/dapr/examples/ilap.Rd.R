library(dapr)


### Name: ilap
### Title: Iterator list apply
### Aliases: ilap

### ** Examples


## return string list
ilap(1:10, ~ paste0(letters[.i], rev(LETTERS)[.i]))

## return list of columns
ilap(mtcars, ~ c(row.names(mtcars)[.i], mtcars$wt[.i]))




