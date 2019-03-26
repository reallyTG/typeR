library(qcr)


### Name: qcs.pcr
### Title: Process capability indices for a given dataset and distribution
### Aliases: qcs.pcr

### ** Examples

library(qcr)
data(pistonrings) 
xbar <- qcs.xbar(pistonrings[1:125,],plot = TRUE)
limits = c(lsl = 73.99, usl = 74.01)
qcs.pcr(xbar, "normal", limits = limits) 
qcs.pcr(xbar, "weibull", limits = limits)



