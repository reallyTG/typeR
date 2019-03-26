library(braidrm)


### Name: braidrm
### Title: BRAID Synergy Dose-Response Modeling
### Aliases: braidrm braidrm.default braidrm.formula print.braidrm
###   summary.braidrm print.summary.braidrm
### Keywords: regression

### ** Examples

data(es8olatmz)
summary(braidrm(act~conc1+conc2,es8olatmz,getCIs=FALSE))
## Not run: 
##D summary(braidrm(cbind(es8olatmz$conc1,es8olatmz$conc2),es8olatmz$act))
##D summary(braidrm(act~conc1+conc2,es8olatmz,fixed="delta2"))
##D summary(braidrm(act~conc1+conc2,es8olatmz,fixed=c(1,2,3,4,6,8,9)))
##D summary(braidrm(act~conc1+conc2,es8olatmz,llims=c(NA,NA,NA,NA,NA,NA,NA,-4,-4,-4)))
## End(Not run)



