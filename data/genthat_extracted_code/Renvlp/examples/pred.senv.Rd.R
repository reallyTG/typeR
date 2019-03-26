library(Renvlp)


### Name: pred.senv
### Title: Estimation or prediction for senv
### Aliases: pred.senv

### ** Examples

data(sales)
X <- sales[, 1:3]
Y <- sales[, 4:7]

m <- senv(X, Y, 2)

pred.res <- pred.senv(m, X[2, ])
pred.res




