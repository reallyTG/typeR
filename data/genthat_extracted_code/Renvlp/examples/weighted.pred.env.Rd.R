library(Renvlp)


### Name: weighted.pred.env
### Title: Estimation or prediction using weighted partial envelope
### Aliases: weighted.pred.env

### ** Examples

data(fiberpaper)
X <- fiberpaper[, 5:7]
Y <- fiberpaper[, 1:4]

pred.res <- weighted.pred.env(X, Y, X[10, ])




