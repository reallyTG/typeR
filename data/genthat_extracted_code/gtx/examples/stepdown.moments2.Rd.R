library(gtx)


### Name: stepdown.moments2
### Title: Stepwise downward model selection using summary statistic
###   matrix.
### Aliases: stepdown.moments2

### ** Examples

data(mthfrex)
xtx <- make.moments2(mthfr.params, c("SBP", "DBP", "SexC", "Age"), mthfrex)
allsnps <- paste(mthfr.params$snp, mthfr.params$coded.allele, sep = "_")
myfit <- stepdown.moments2(xtx, "SBP", allsnps, c("ONE", "SexC", "Age"))
## much faster than stepAIC but only steps to bigger models
cbind(beta = myfit$betahat, se = myfit$se, t = myfit$beta/myfit$se)



