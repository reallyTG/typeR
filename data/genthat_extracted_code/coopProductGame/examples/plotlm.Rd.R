library(coopProductGame)


### Name: plotlm
### Title: Plot method for linear production programming problems
### Aliases: plotlm

### ** Examples

# Vector of benefits
c <- c(68,52)
# Matrix of coefficients
A <- matrix(c(4,5,6,2), ncol = 2, byrow = TRUE)
# Vector of resources
b <- c(4,33)
# Make the associated linear program 
prod <- makeLP(c, A, b)
plotlm(prod, A, b, c)




