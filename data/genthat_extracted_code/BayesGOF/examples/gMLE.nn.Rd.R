library(BayesGOF)


### Name: gMLE.nn
### Title: Normal-Normal Parameter Estimation
### Aliases: gMLE.nn

### ** Examples

data(ulcer)
### MLE estimate of alpha and beta
ulcer.mle <- gMLE.nn(ulcer$y, ulcer$se, method = "DL")$estimate
ulcer.mle
ulcer.reml <- gMLE.nn(ulcer$y, ulcer$se, method = "REML")$estimate
ulcer.reml



