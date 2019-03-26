library(Renvlp)


### Name: testcoef.penv
### Title: Hypothesis test of the coefficients of the partial envelope
###   model
### Aliases: testcoef.penv

### ** Examples

data(fiberpaper)
X1 <- fiberpaper[, 7]
X2 <- fiberpaper[, 5:6]
Y <- fiberpaper[, 1:4]
m <- penv(X1, X2, Y, 1)
m

L <- diag(4)
R <- as.matrix(1)
A <- matrix(0, 4, 1)

test.res <- testcoef.penv(m, L, R, A)
test.res



