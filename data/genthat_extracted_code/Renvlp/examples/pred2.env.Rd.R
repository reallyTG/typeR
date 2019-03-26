library(Renvlp)


### Name: pred2.env
### Title: Estimation or prediction for env
### Aliases: pred2.env

### ** Examples

data(fiberpaper)
X <- fiberpaper[, 5:7]
Y <- fiberpaper[, 1:4]

u <- u.pred2.env(X, Y, X[10, ])
pred.res <- pred2.env(X, Y, u$u.bic, X[10, ])
pred.res$SE.estm
pred.res$SE.pred



