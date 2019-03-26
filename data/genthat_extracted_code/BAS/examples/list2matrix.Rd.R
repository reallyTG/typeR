library(BAS)


### Name: list2matrix.bas
### Title: Coerce a BAS list object into a matrix.
### Aliases: list2matrix.bas list2matrix
### Keywords: regression

### ** Examples


data(Hald)
hald.bic <-  bas.lm(Y ~ ., data=Hald, prior="BIC",
                    initprobs= "eplogp")
coef <- list2matrix.bas(hald.bic, "mle")  # extract all coefficients
se <- list2matrix.bas(hald.bic, "mle.se")
models <- list2matrix.which(hald.bic)     #matrix of model indicators
models <- which.matrix(hald.bic$which, hald.bic$n.vars)     #matrix of model indicators




