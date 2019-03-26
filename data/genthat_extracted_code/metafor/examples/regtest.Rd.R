library(metafor)


### Name: regtest
### Title: Regression Test for Funnel Plot Asymmetry
### Aliases: regtest regtest.rma regtest.default
### Keywords: htest

### ** Examples

### calculate log risk ratios and corresponding sampling variances
dat <- escalc(measure="RR", ai=tpos, bi=tneg, ci=cpos, di=cneg, data=dat.bcg)

### fit random-effects model
res <- rma(yi, vi, data=dat)

### classical Egger test
regtest(res, model="lm")

### random/mixed-effects version of the Egger test
regtest(res)

### same tests, but passing outcomes directly
regtest(dat$yi, dat$vi, model="lm")
regtest(dat$yi, dat$vi)

### examples using the sample size (or a transformation thereof) as predictor
regtest(res, model="lm", predictor="ni")
regtest(res, model="lm", predictor="ninv")
regtest(res, model="rma", predictor="ni")
regtest(res, model="rma", predictor="ninv")

### if dat$yi is computed with escalc(), sample size information is stored in attributes
dat$yi

### then this will work
regtest(dat$yi, dat$vi, predictor="ni")

### otherwise have to supply sample sizes manually
dat$ni <- with(dat, tpos + tneg + cpos + cneg)
regtest(dat$yi, dat$vi, dat$ni, predictor="ni")

### testing for asymmetry after accounting for the influence of a moderator
res <- rma(yi, vi, mods = ~ ablat, data=dat)
regtest(res, model="lm")
regtest(res)



