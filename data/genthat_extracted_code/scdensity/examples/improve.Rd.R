library(scdensity)


### Name: improve
### Title: Move points closer to a target while maintaining a constraint.
### Aliases: improve

### ** Examples

#Constrain points to be inside the hypercube with vertices at -1 and +1.
#The target point is a vector of independent random standard normal variates.
#Start at rep(0,n) and "improve" the solution toward the target.
n <- 20
incube <- function(x) all(x <= 1 & x >= -1)
x0 <- rep(0,n)
target <- sort(rnorm(n))
xstar <- improve(x0, target, incube, verbose=TRUE)
dist <- abs(target - xstar)
zapsmall(cbind(target, xstar, dist), 4)



