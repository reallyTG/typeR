library(cdfquantreg)


### Name: summary.cdfqr
### Title: S3 Methods for getting output from fitted cdfqr Objects.
### Aliases: summary.cdfqr print.cdfqr logLik.cdfqr nobs.cdfqr
###   deviance.cdfqr coef.cdfqr vcov.cdfqr update.cdfqr formula.cdfqr
###   confint.cdfqr

### ** Examples

data(cdfqrExampleData)
fit <- cdfquantreg(crc99 ~ vert | confl, 't2','t2', data = JurorData)

summary(fit)
print(fit)
logLik(fit)
coef(fit)
deviance(fit)
vcov(fit)
confint(fit)

#Update the model
fit2 <- update(fit, crc99 ~ vert*confl | confl)
summary(fit2)




