library(Renvlp)


### Name: senv
### Title: Fit the scaled envelope model
### Aliases: senv

### ** Examples

data(sales)
X <- sales[, 1:3]
Y <- sales[, 4:7]

u <- u.senv(X, Y)
u

m <- senv(X, Y, 2)
m$beta



