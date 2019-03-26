library(gtx)


### Name: stepup.moments2
### Title: Stepwise upward model selection using summary statistic matrix.
### Aliases: stepup.moments2

### ** Examples

data(mthfrex)
xtx <- make.moments2(mthfr.params, c("SBP", "DBP", "SexC", "Age"), mthfrex)
allsnps <- paste(mthfr.params$snp, mthfr.params$coded.allele, sep = "_")
myfit <- stepup.moments2(xtx, "SBP", allsnps, c("ONE", "SexC", "Age"))
## much faster than stepAIC but only steps to bigger models
cbind(beta = myfit$betahat, se = myfit$se, t = myfit$beta/myfit$se)



