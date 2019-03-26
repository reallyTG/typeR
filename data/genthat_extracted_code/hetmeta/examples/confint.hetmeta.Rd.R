library(hetmeta)


### Name: confint.hetmeta
### Title: Confidence Intervals for 'hetmeta' Objects
### Aliases: confint.hetmeta

### ** Examples

## load BCG vaccine data
data(dat.bcg)

## random-effects model of log relative risks
dat <- escalc(measure="RR", ai=tpos, bi=tneg, ci=cpos, di=cneg, data=dat.bcg)
res <- rma(yi, vi, data=dat)

## heterogeneity measures
het <- hetmeta(res)
confint(het)



