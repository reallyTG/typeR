library(metafor)


### Name: update.rma
### Title: Model Updating for 'rma' Objects
### Aliases: update.rma
### Keywords: models

### ** Examples

### calculate log risk ratios and corresponding sampling variances
dat <- escalc(measure="RR", ai=tpos, bi=tneg, ci=cpos, di=cneg, data=dat.bcg)

### random-effects model (method="REML" is default)
res <- rma(yi, vi, data=dat, digits=3)
res

### mixed-effects model with two moderators (absolute latitude and publication year)
res <- update(res, ~ ablat + year)
res

### remove 'year' moderator
res <- update(res, ~ . - year)
res

### fit model with ML estimation
update(res, method="ML")

### example with rma.glmm()
res <- rma.glmm(measure="OR", ai=tpos, bi=tneg, ci=cpos, di=cneg, data=dat.bcg, digits=3)
res <- update(res, mods = ~ ablat)
res

### conditional model with approximate likelihood
update(res, model="CM.AL")



