library(Renvlp)


### Name: testcoef.xenv
### Title: Hypothesis test of the coefficients of the envelope model
### Aliases: testcoef.xenv

### ** Examples

data(wheatprotein)
X <- wheatprotein[, 1:6]
Y <- wheatprotein[, 7]
m <- xenv(X, Y, 2)
m

L <- diag(6)
R <- as.matrix(1)
A <- matrix(0, 6, 1)

test.res <- testcoef.xenv(m, L, R, A)
test.res



