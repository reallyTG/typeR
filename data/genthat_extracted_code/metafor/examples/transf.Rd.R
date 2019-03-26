library(metafor)


### Name: transf
### Title: Transformation Function
### Aliases: transf transf.rtoz transf.ztor transf.logit transf.ilogit
###   transf.arcsin transf.iarcsin transf.pft transf.ipft transf.ipft.hm
###   transf.isqrt transf.irft transf.iirft transf.ahw transf.iahw
###   transf.abt transf.iabt transf.ztor.int transf.exp.int
###   transf.ilogit.int
### Keywords: manip

### ** Examples

### meta-analysis of the log risk ratios using a random-effects model
res <- rma(measure="RR", ai=tpos, bi=tneg, ci=cpos, di=cneg, data=dat.bcg)

### average risk ratio with 95% CI
predict(res, transf=exp)

### average risk ratio with 95% CI using the integral transformation
predict(res, transf=transf.exp.int, targs=list(tau2=res$tau2, lower=-4, upper=4))



