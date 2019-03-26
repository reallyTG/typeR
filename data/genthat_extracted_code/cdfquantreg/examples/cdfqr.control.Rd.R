library(cdfquantreg)


### Name: cdfqr.control
### Title: Control Optimization Parameters for CDF-Quantile Probability
###   Distributions
### Aliases: cdfqr.control

### ** Examples


data(cdfqrExampleData)
fit <- cdfquantreg(crc99 ~ vert | confl, 't2', 't2', 
data = JurorData,control = cdfqr.control(trace = TRUE))



