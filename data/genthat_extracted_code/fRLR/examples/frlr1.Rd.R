library(fRLR)


### Name: frlr1
### Title: Fit Repeated Linear Regressions with One Variable
### Aliases: frlr1
### Keywords: repeated linear regressions

### ** Examples

library(fRLR)
set.seed(123)
X = matrix(rnorm(50), 10, 5)
Y = rnorm(10)
COV = matrix(rnorm(40), 10, 4)
frlr1(X, Y, COV)



