library(metafor)


### Name: simulate.rma
### Title: Simulate Method for 'rma' Objects
### Aliases: simulate.rma
### Keywords: models

### ** Examples

### load BCG vaccine data
dat <- get(data(dat.bcg))

### calculate log risk ratios and corresponding sampling variances
dat <- escalc(measure="RR", ai=tpos, bi=tneg, ci=cpos, di=cneg, data=dat.bcg)
dat

### random-effects model
res <- rma(yi, vi, data=dat)
res

### simulate outcomes from model
newdat <- simulate(res, nsim=10, seed=1234)



