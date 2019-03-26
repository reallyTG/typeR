library(Renvlp)


### Name: env
### Title: Fit the envelope model
### Aliases: env

### ** Examples

data(wheatprotein)
X <- wheatprotein[, 8]
Y <- wheatprotein[, 1:6]
u <- u.env(X, Y)
u

m <- env(X, Y, 1)
m
m$beta



