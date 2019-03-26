library(Renvlp)


### Name: testcoef.stenv
### Title: Hypothesis test of the coefficients of the simultaneous envelope
###   model
### Aliases: testcoef.stenv

### ** Examples

data(fiberpaper)
X <- fiberpaper[ , 5:7]
Y <- fiberpaper[ , 1:4]
m <- stenv(X, Y, 2, 3)

L <- diag(3)
R <- as.matrix(c(1, 0, 0, 0), nrow = 4)
A <- matrix(0, 3, 1)

test.res <- testcoef.stenv(m, L, R, A)
test.res



