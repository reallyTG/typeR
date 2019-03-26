library(minqa)


### Name: uobyqa
### Title: An R interface to the uobyqa implementation of Powell
### Aliases: uobyqa
### Keywords: nonlinear optimize

### ** Examples

fr <- function(x) {   ## Rosenbrock Banana function
    100 * (x[2] - x[1]^2)^2 + (1 - x[1])^2
}
(x3 <- uobyqa(c(1, 2), fr))
## => optimum at c(1, 1) with fval = 0
# check the error exits
# too many iterations
x3e<-uobyqa(c(1, 2), fr, control = list(maxfun=50))
str(x3e)


# To add if we can find them -- examples of ierr = 3.





