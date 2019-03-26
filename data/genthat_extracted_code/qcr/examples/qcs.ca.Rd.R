library(qcr)


### Name: qcs.ca
### Title: Capability Analysis
### Aliases: qcs.ca

### ** Examples

library(qcr)
data(pistonrings) 
xbar <- qcs.xbar(pistonrings[1:125,],plot = TRUE)
LSL=73.99; USL=74.01
limits = c(lsl = 73.99, usl = 74.01)
qcs.ca(xbar, limits = limits)



