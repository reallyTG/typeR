library(splitfngr)


### Name: fngr
### Title: Access a list of values separately but calculate them together.
###   This function generalizes grad_share for any number of functions.
### Aliases: fngr

### ** Examples

tfunc <- function(x) {list(x+1, x+2, x+3, x+4, x+5)}
f <- fngr(tfunc)
f(1)(0)
f(3)(0)
f(3)(1)
f(1)(23.4)
f(4)()

# Use same function but only recalculate when first value is called
g <- fngr(tfunc, evalForNewX = FALSE, recalculate_indices = c(1))
g1 <- g(1)
g3 <- g(3)
g1(1)
g3(1)
g3(11) # This won't be give expected value
g1(11) # This updates all values
g3(11) # This is right



