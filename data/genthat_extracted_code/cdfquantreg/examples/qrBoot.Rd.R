library(cdfquantreg)


### Name: qrBoot
### Title: Bootstrapping for cdf quantile regression
### Aliases: qrBoot

### ** Examples

data(cdfqrExampleData)
fit <- cdfquantreg(crc99 ~ vert | confl, 't2', 't2', data = JurorData)
qrBoot(fit, rn = 50, R = 50)




