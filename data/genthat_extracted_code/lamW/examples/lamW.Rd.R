library(lamW)


### Name: lambertW
### Title: Lambert-W Function
### Aliases: lambertW0 lambertWm1
### Keywords: NumericalMathematics

### ** Examples

lambertW0(exp(1))      ## Should equal 1, as 1 * exp(1) = e.
lambertW0(0)           ## Should equal 0, as 0 * exp(0) = 0.
lambertW0(-exp(-1))    ## Should equal -1.
lambertWm1(-exp(-1))   ## Should also equal -1.
A <- -2 * exp(-2)
lambertWm1(A)          ## Should equal -2



