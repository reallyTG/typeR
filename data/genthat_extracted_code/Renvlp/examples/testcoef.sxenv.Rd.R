library(Renvlp)


### Name: testcoef.sxenv
### Title: Hypothesis test of the coefficients of the scaled envelope model
###   in the predictor space
### Aliases: testcoef.sxenv

### ** Examples

data(sales)
Y <- sales[, 1:3]
X <- sales[, 4:7]
R <- rep(1, 4)

u <- u.sxenv(X, Y, R)
u

m <- sxenv(X, Y, 2, R)

L <- diag(4)
R <- as.matrix(c(1, 0, 0))
A <- matrix(0, 4, 1)

test.res <- testcoef.sxenv(m, L, R, A)
test.res



