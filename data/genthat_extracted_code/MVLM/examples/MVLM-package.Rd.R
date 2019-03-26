library(MVLM)


### Name: MVLM-package
### Title: Multivariate Linear Model with Analytic p-values
### Aliases: MVLM MVLM-package

### ** Examples

data(mvlmdata)
Y <- as.matrix(Y.mvlm)
mvlm.res <- mvlm(Y ~ Cont + Cat + Ord, data = X.mvlm)
summary(mvlm.res)




