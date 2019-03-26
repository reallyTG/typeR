library(Renvlp)


### Name: pred.sxenv
### Title: Estimation or prediction for sxenv
### Aliases: pred.sxenv

### ** Examples

data(sales)
Y <- sales[, 1:3]
X <- sales[, 4:7]
R <- rep(1, 4)

m <- sxenv(X, Y, 2, R)

pred.res <- pred.sxenv(m, X[1, ])
pred.res




