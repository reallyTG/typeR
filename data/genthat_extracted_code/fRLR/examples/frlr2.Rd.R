library(fRLR)


### Name: frlr2
### Title: Fit Repeated Linear Regressions with Two Variables
### Aliases: frlr2
### Keywords: repeated linear regressions

### ** Examples

library(fRLR)
set.seed(123)
X = matrix(rnorm(50), 10, 5)
Y = rnorm(10)
COV = matrix(rnorm(40), 10, 4)
idx1 = c(1, 2, 3, 4, 1, 1, 1, 2, 2, 3)
idx2 = c(2, 3, 4, 5, 3, 4, 5, 4, 5, 5)
frlr2(t(X), idx1, idx2, Y, t(COV))



