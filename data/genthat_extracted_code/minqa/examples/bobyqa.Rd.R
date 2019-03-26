library(minqa)


### Name: bobyqa
### Title: An R interface to the bobyqa implementation of Powell
### Aliases: bobyqa
### Keywords: nonlinear optimize

### ** Examples

fr <- function(x) {   ## Rosenbrock Banana function
    100 * (x[2] - x[1]^2)^2 + (1 - x[1])^2
}
(x1 <- bobyqa(c(1, 2), fr, lower = c(0, 0), upper = c(4, 4)))
## => optimum at c(1, 1) with fval = 0

str(x1)  # see that the error code and msg are returned

# check the error exits
# too many iterations
x1e<-bobyqa(c(1, 2), fr, lower = c(0, 0), upper = c(4, 4), control = list(maxfun=50))
str(x1e)

# Throw an error because bounds too tight
x1b<-bobyqa(c(4,4), fr, lower = c(0, 3.9999999), upper = c(4, 4))
str(x1b)

# Throw an error because npt is too small -- does NOT work as of 2010-8-10 as 
#    minqa.R seems to force a reset.
x1n<-bobyqa(c(2,2), fr, lower = c(0, 0), upper = c(4, 4), control=list(npt=1))
str(x1n)

# To add if we can find them -- examples of ierr = 3 and ierr = 5.




