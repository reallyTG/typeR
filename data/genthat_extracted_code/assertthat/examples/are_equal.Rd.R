library(assertthat)


### Name: are_equal
### Title: Are two objects equal?
### Aliases: are_equal

### ** Examples

x <- 2
see_if(are_equal(x, 1.9))
see_if(are_equal(x, 1.999, tol = 0.01))
see_if(are_equal(x, 2))



