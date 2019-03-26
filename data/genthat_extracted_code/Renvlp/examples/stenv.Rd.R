library(Renvlp)


### Name: stenv
### Title: Fit the simultaneous envelope model
### Aliases: stenv

### ** Examples

data(fiberpaper)
X <- fiberpaper[, 5:7]
Y <- fiberpaper[, 1:4]
u <- u.stenv(X, Y)
u

m <- stenv(X, Y, 2, 3)
m
m$beta



