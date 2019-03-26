library(cumplyr)


### Name: cartesian_product
### Title: Compute the Cartesian product of named variables.
### Aliases: cartesian_product

### ** Examples

library('cumplyr')
x <- 1:2
y <- 10:11
cartesian_product(c('x', 'y'))

tmp.env <- new.env()
assign('x', 1:3, envir = tmp.env)
assign('y', 2:4, envir = tmp.env)
cartesian_product(c('x', 'y'), envir = tmp.env)



