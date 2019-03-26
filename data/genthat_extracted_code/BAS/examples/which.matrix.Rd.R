library(BAS)


### Name: which.matrix
### Title: Coerce a BAS list object of models into a matrix.
### Aliases: which.matrix
### Keywords: regression

### ** Examples


data(Hald)
Hald.bic <-  bas.lm(Y ~ ., data=Hald, prior="BIC", initprobs="eplogp")
# matrix of model indicators
models <- which.matrix(Hald.bic$which, Hald.bic$n.vars)




