library(minqa)


### Name: newuoa
### Title: An R interface to the NEWUOA implementation of Powell
### Aliases: newuoa
### Keywords: nonlinear optimize

### ** Examples

fr <- function(x) {   ## Rosenbrock Banana function
    100 * (x[2] - x[1]^2)^2 + (1 - x[1])^2
}
(x2 <- newuoa(c(1, 2), fr))
## => optimum at c(1, 1) with fval = 0

# check the error exits
# too many iterations
x2e<-newuoa(c(1, 2), fr, control = list(maxfun=50))
str(x2e)

# Throw an error because npt is too small -- does NOT work as of 2010-8-10 as 
#    minqa.R seems to force a reset.
x2n<-newuoa(c(2,2), fr, control=list(npt=1))
str(x2n)

# To add if we can find them -- examples of ierr = 3 and ierr = 5.






