library(cdfquantreg)


### Name: cdfquantreg
### Title: CDF-Quantile Probability Distributions
### Aliases: cdfquantreg

### ** Examples

data(cdfqrExampleData)
fit <- cdfquantreg(crc99 ~ vert | confl, fd ='t2',sd ='t2', data = JurorData)

summary(fit)



