library(coopProductGame)


### Name: makeLP
### Title: Make a linear production programming problem
### Aliases: makeLP

### ** Examples

# Vector of benefits
c <- c(68,52)
# Production matrix
A <- matrix(c(4, 5, 6, 2), ncol = 2, byrow = TRUE)
# Vector of resources
b <- c(4,33)
# Make the associated linear production problem 
prod <- makeLP(c, A, b)
  



