library(fRLR)


### Name: frlr
### Title: Fit Repeated Linear Regressions with the Product of Two
###   Variables
### Aliases: frlr
### Keywords: repeated linear regressions

### ** Examples

library(fRLR)
set.seed(123)
X = matrix(rnorm(50), 10, 5)
Y = rnorm(10)
COV = matrix(rnorm(40), 10, 4)
frlr(X, Y, COV)



