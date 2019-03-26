library(Renvlp)


### Name: penv
### Title: Fit the partial envelope model
### Aliases: penv

### ** Examples

data(fiberpaper)
X1 <- fiberpaper[, 7]
X2 <- fiberpaper[, 5:6]
Y <- fiberpaper[, 1:4]
u <- u.penv(X1, X2, Y)
u

m <- penv(X1, X2, Y, 1)
m
m$beta1



