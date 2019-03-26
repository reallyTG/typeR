library(metafor)


### Name: coef.rma
### Title: Extract the Model Coefficients and Coefficient Table from 'rma'
###   and 'summary.rma' Objects
### Aliases: coef.rma coef.summary.rma
### Keywords: models

### ** Examples

### meta-analysis of the log risk ratios using a mixed-effects model
### with two moderators (absolute latitude and publication year)
res <- rma(measure="RR", ai=tpos, bi=tneg, ci=cpos, di=cneg,
           mods = ~ ablat + year, data=dat.bcg)
coef(res)
coef(summary(res))



