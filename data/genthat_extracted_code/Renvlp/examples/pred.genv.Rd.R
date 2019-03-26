library(Renvlp)


### Name: pred.genv
### Title: Estimation or prediction for genv
### Aliases: pred.genv

### ** Examples

data(fiberpaper)
X <- fiberpaper[ , c(5, 7)]
Y <- fiberpaper[ , 1:3]
Z <- as.numeric(fiberpaper[ , 6] > mean(fiberpaper[ , 6]))
u <- u.genv(X, Y, Z)
u

m <- genv(X, Y, Z, 2)
m

X <- as.matrix(X)
pred.res <- pred.genv(m, X[2, ], Z[2])
pred.res




