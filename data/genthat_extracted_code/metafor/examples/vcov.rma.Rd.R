library(metafor)


### Name: vcov.rma
### Title: Extract the Variance-Covariance Matrix of the Parameter
###   Estimates from 'rma' Objects
### Aliases: vcov.rma
### Keywords: models

### ** Examples

### meta-analysis of the log risk ratios using a mixed-effects model
### with two moderators (absolute latitude and publication year)
res <- rma(measure="RR", ai=tpos, bi=tneg, ci=cpos, di=cneg,
           mods = ~ ablat + year, data=dat.bcg)
vcov(res)

### marginal var-cov matrix of the observed log risk ratios
vcov(res, type="obs")



