library(metafor)


### Name: ranef
### Title: Best Linear Unbiased Predictions for 'rma.uni' and 'rma.mv'
###   Objects
### Aliases: ranef ranef.rma.uni ranef.rma.mv
### Keywords: models

### ** Examples

### calculate log risk ratios and corresponding sampling variances
dat <- escalc(measure="RR", ai=tpos, bi=tneg, ci=cpos, di=cneg, data=dat.bcg)

### meta-analysis of the log risk ratios using a random-effects model
res <- rma(yi, vi, data=dat)

### BLUPs of the random effects
ranef(res)



