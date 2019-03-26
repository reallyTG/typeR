library(Renvlp)


### Name: sxenv
### Title: Fit the scaled envelope model in the predictor space
### Aliases: sxenv

### ** Examples

data(sales)
Y <- sales[, 1:3]
X <- sales[, 4:7]
R <- rep(1, 4)

u <- u.sxenv(X, Y, R)
u

m <- sxenv(X, Y, 2, R)
m$beta



