library(Renvlp)


### Name: testcoef.senv
### Title: Hypothesis test of the coefficients of the scaled envelope model
### Aliases: testcoef.senv

### ** Examples

data(sales)
X <- sales[, 1:3]
Y <- sales[, 4:7]

m <- senv(X, Y, 2)

L <- diag(4)
R <- as.matrix(c(1, 0, 0))
A <- matrix(0, 4, 1)

test.res <- testcoef.senv(m, L, R, A)
test.res



