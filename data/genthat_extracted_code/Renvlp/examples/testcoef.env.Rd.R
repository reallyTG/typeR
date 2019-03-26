library(Renvlp)


### Name: testcoef.env
### Title: Hypothesis test of the coefficients of the envelope model
### Aliases: testcoef.env

### ** Examples

data(wheatprotein)
X <- wheatprotein[, 8]
Y <- wheatprotein[, 1:6]
m <- env(X, Y, 1)
m

L <- diag(6)
R <- as.matrix(1)
A <- matrix(0, 6, 1)

test.res <- testcoef.env(m, L, R, A)
test.res



