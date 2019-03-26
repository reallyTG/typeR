library(MVLM)


### Name: residuals.mvlm
### Title: Extract mvlm Residuals
### Aliases: residuals.mvlm

### ** Examples

data(mvlmdata)
Y <- as.matrix(Y.mvlm)
mvlm.res <- mvlm(Y ~ Cont + Cat + Ord, data = X.mvlm)
Y.resid <- resid(mvlm.res)




