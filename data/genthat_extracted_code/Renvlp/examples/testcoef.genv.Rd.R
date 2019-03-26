library(Renvlp)


### Name: testcoef.genv
### Title: Hypothesis test of the coefficients of the groupwise envelope
###   model
### Aliases: testcoef.genv

### ** Examples

data(fiberpaper)
X <- fiberpaper[ , c(5, 7)]
Y <- fiberpaper[ , 1:3]
Z <- as.numeric(fiberpaper[ , 6] > mean(fiberpaper[ , 6]))
u <- u.genv(X, Y, Z)
u

m <- genv(X, Y, Z, 2)
m

L <- diag(3)
R <- diag(2)
A <- matrix(0, 3, 2)

test.res <- testcoef.genv(m, L, R, A)
test.res



