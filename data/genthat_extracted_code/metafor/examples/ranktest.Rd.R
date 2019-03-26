library(metafor)


### Name: ranktest
### Title: Rank Correlation Test for Funnel Plot Asymmetry
### Aliases: ranktest ranktest.rma ranktest.default
### Keywords: htest

### ** Examples

### calculate log risk ratios and corresponding sampling variances
dat <- escalc(measure="RR", ai=tpos, bi=tneg, ci=cpos, di=cneg, data=dat.bcg)

### random-effects model
res <- rma(yi, vi, data=dat)

ranktest(res)
ranktest(dat$yi, dat$vi)



