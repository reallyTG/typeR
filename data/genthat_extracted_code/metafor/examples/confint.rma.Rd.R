library(metafor)


### Name: confint.rma.uni
### Title: Confidence Intervals for 'rma' Objects
### Aliases: confint.rma.uni confint.rma.mh confint.rma.peto
###   confint.rma.glmm confint.rma.mv
### Keywords: models

### ** Examples

### meta-analysis of the log risk ratios using a random-effects model
res <- rma(measure="RR", ai=tpos, bi=tneg, ci=cpos, di=cneg, data=dat.bcg)

### confidence interval for the total amount of heterogeneity
confint(res)

### mixed-effects model with absolute latitude in the model
res <- rma(measure="RR", ai=tpos, bi=tneg, ci=cpos, di=cneg,
           mods = ~ ablat, data=dat.bcg)

### confidence interval for the residual amount of heterogeneity
confint(res)

### multilevel random-effects model
res <- rma.mv(yi, vi, random = ~ 1 | district/school, data=dat.konstantopoulos2011)

### profile plots and confidence intervals for the variance components
## Not run: 
##D par(mfrow=c(2,1))
##D profile(res, sigma2=1)
##D abline(h=logLik(res) - qchisq(.95, df=1)/2, lty="dotted")
##D sav <- confint(res, sigma2=1)
##D sav
##D abline(v=sav$random[1,2:3], lty="dotted")
##D profile(res, sigma2=2)
##D abline(h=logLik(res) - qchisq(.95, df=1)/2, lty="dotted")
##D sav <- confint(res, sigma2=2)
##D sav
##D abline(v=sav$random[1,2:3], lty="dotted")
## End(Not run)

### multivariate parameterization of the model
res <- rma.mv(yi, vi, random = ~ factor(school) | district, data=dat.konstantopoulos2011)

### profile plots and confidence intervals for the variance component and correlation
## Not run: 
##D par(mfrow=c(2,1))
##D profile(res, tau2=1)
##D abline(h=logLik(res) - qchisq(.95, df=1)/2, lty="dotted")
##D sav <- confint(res, tau2=1)
##D sav
##D abline(v=sav$random[1,2:3], lty="dotted")
##D profile(res, rho=1)
##D abline(h=logLik(res) - qchisq(.95, df=1)/2, lty="dotted")
##D sav <- confint(res, rho=1)
##D sav
##D abline(v=sav$random[1,2:3], lty="dotted")
## End(Not run)



