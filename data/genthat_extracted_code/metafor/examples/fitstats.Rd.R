library(metafor)


### Name: fitstats
### Title: Fit Statistics and Information Criteria for 'rma' Objects
### Aliases: fitstats fitstats.rma logLik.rma deviance.rma AIC.rma BIC.rma
###   nobs.rma df.residual.rma
### Keywords: models

### ** Examples

### meta-analysis of the log risk ratios using a random-effects model
res1 <- rma(measure="RR", ai=tpos, bi=tneg, ci=cpos, di=cneg,
            data=dat.bcg, method="ML")

### mixed-effects model with two moderators (latitude and publication year)
res2 <- rma(measure="RR", ai=tpos, bi=tneg, ci=cpos, di=cneg, mods = ~ ablat + year,
            data=dat.bcg, method="ML")

fitstats(res1, res2)

logLik(res1)
logLik(res2)

deviance(res1)
deviance(res2)

AIC(res1, res2)
AIC(res1, res2, correct=TRUE)
BIC(res1, res2)



