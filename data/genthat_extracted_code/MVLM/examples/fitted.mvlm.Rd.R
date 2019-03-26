library(MVLM)


### Name: fitted.mvlm
### Title: Extract mvlm Fitted Values
### Aliases: fitted.mvlm

### ** Examples

data(mvlmdata)
Y <- as.matrix(Y.mvlm)
mvlm.res <- mvlm(Y ~ Cont + Cat + Ord, data = X.mvlm)
Y.hat <- fitted(mvlm.res)




