library(cdfquantreg)


### Name: cdfquantregC
### Title: Censored CDF-Quantile Probability Distributions
### Aliases: cdfquantregC

### ** Examples

data(cdfqrExampleData)
fit <- cdfquantregC(crc99 ~ vert | confl, c1 = 0.001, c2= 0.999, 
fd ='t2',sd ='t2', data = JurorData)

summary(fit)



