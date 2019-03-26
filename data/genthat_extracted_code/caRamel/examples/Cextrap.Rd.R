library(caRamel)


### Name: Cextrap
### Title: Cextrap
### Aliases: Cextrap

### ** Examples

# Definition of the parameters
param <- matrix(rexp(100), 100, 1)
crit <- matrix(rexp(200), 100, 2)
directions <- matrix(c(1,3,2,7,13,40), nrow = 3, ncol = 2)
longu <- runif(3)
n <- 5
# Call the function
res <- Cextrap(param, crit, directions, longu, n)




