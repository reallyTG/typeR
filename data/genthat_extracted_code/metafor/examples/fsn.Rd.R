library(metafor)


### Name: fsn
### Title: Fail-Safe N Analysis (File Drawer Analysis)
### Aliases: fsn
### Keywords: htest

### ** Examples

### calculate log risk ratios and corresponding sampling variances
dat <- escalc(measure="RR", ai=tpos, bi=tneg, ci=cpos, di=cneg, data=dat.bcg)

fsn(yi, vi, data=dat)
fsn(yi, vi, data=dat, type="Orwin")
fsn(yi, vi, data=dat, type="Rosenberg")



