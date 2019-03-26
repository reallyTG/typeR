library(metafor)


### Name: print.escalc
### Title: Print and Summary Methods for 'escalc' Objects
### Aliases: print.escalc summary.escalc
### Keywords: print

### ** Examples

### calculate log risk ratios and corresponding sampling variances
dat <- escalc(measure="RR", ai=tpos, bi=tneg, ci=cpos, di=cneg, data=dat.bcg)
dat

### apply summary function
summary(dat)
summary(dat, transf=exp)



