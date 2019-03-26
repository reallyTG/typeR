library(cdfquantreg)


### Name: summary.cdfqrH
### Title: S3 Methods for getting output from fitted cdfqrr Objects.
### Aliases: summary.cdfqrH print.cdfqrH logLik.cdfqrH nobs.cdfqrH
###   deviance.cdfqrH coef.cdfqrH vcov.cdfqrH update.cdfqrH formula.cdfqrH
###   confint.cdfqrH

### ** Examples

data(cdfqrHExampleData)
ipcc_mid <- subset(IPCC, mid == 1 & high == 0)
fit <- cdfquantregH(prob ~ valence | valence, zero.fo = ~valence,
  one.fo = ~valence,
  fd ='t2',sd ='t2', type = "ZO", data = ipcc_mid)

summary(fit)
print(fit)
logLik(fit)
coef(fit)
deviance(fit)
vcov(fit)
confint(fit)





