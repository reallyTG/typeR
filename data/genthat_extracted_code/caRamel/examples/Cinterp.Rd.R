library(caRamel)


### Name: Cinterp
### Title: Cinterp
### Aliases: Cinterp

### ** Examples

# Definition of the parameters
param <- matrix(rexp(100), 100, 1)
crit <- matrix(rexp(200), 100, 2)
simplices <- matrix(c(15,2,1,15,22,1,18,15,2,17,13,14), nrow = 4, ncol = 3)
volume <- runif(4)
n <- 5
# Call the function
res <- Cinterp(param, crit, simplices, volume, n)




