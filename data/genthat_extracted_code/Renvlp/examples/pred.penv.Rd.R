library(Renvlp)


### Name: pred.penv
### Title: Estimation or prediction for penv
### Aliases: pred.penv

### ** Examples

data(fiberpaper)
X1 <- fiberpaper[, 7]
X2 <- fiberpaper[, 5:6]
Y <- fiberpaper[, 1:4]
m <- penv(X1, X2, Y, 1)

pred.res <- pred.penv(m, X1[1], X2[1, ])
pred.res



