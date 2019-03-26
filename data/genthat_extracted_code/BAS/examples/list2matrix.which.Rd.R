library(BAS)


### Name: list2matrix.which
### Title: Coerce a BAS list object into a matrix.
### Aliases: list2matrix.which
### Keywords: regression

### ** Examples


data(Hald)
Hald.bic <-  bas.lm(Y ~ ., data=Hald, prior="BIC", initprobs="eplogp")
coef <- list2matrix.bas(Hald.bic, "mle")  # extract all ols coefficients
se <- list2matrix.bas(Hald.bic, "mle.se")
models <- list2matrix.which(Hald.bic)     #matrix of model indicators
models <- which.matrix(Hald.bic$which, Hald.bic$n.vars)     #matrix of model indicators




