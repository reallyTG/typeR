library(metafor)


### Name: fitted.rma
### Title: Fitted Values for 'rma' Objects
### Aliases: fitted.rma
### Keywords: models

### ** Examples

### meta-analysis of the log risk ratios using a mixed-effects model
### with two moderators (absolute latitude and publication year)
res <- rma(measure="RR", ai=tpos, bi=tneg, ci=cpos, di=cneg,
           mods = ~ ablat + year, data=dat.bcg)
fitted(res)



