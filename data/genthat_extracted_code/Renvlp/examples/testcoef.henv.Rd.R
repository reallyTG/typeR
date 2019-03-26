library(Renvlp)


### Name: testcoef.henv
### Title: Hypothesis test of the coefficients of the heteroscedastic
###   envelope model
### Aliases: testcoef.henv

### ** Examples

data(waterstrider)
X <- waterstrider[ , 1]
Y <- waterstrider[ , 2:5]

## Not run: m <- henv(X, Y, 2)
## Not run: m

L <- diag(4)
R <- matrix(c(1, -1, 0), 3, 1)
A <- matrix(0, 4, 1)

## Not run: test.res <- testcoef.henv(m, L, R, A)
## Not run: test.res



