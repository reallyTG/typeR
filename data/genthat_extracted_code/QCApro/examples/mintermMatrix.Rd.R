library(QCApro)


### Name: mintermMatrix
### Title: Create Minterm Matrices
### Aliases: mintermMatrix
### Keywords: functions

### ** Examples

# a minterm matrix with three bivalent exogenous factors
noflevels <- rep(2, 3)
mintermMatrix(noflevels)

# with logical values
mintermMatrix(noflevels, logical = TRUE)



