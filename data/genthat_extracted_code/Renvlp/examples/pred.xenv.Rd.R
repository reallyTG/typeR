library(Renvlp)


### Name: pred.xenv
### Title: Estimation or prediction for xenv
### Aliases: pred.xenv

### ** Examples

data(wheatprotein)
X <- wheatprotein[, 1:6]
Y <- wheatprotein[, 7]

m <- xenv(X, Y, 2)
m

pred.res <- pred.xenv(m, X[1, ])
pred.res




