library(Renvlp)


### Name: pred.env
### Title: Estimation or prediction for env
### Aliases: pred.env

### ** Examples

data(wheatprotein)
X <- wheatprotein[, 8]
Y <- wheatprotein[, 1:6]
u <- u.env(X, Y)
u

m <- env(X, Y, 1)
m

X <- as.matrix(X)
pred.res <- pred.env(m, X[2, ])
pred.res




