library(qcr)


### Name: qcs.cp
### Title: Process capability indices (parametric)
### Aliases: qcs.cp

### ** Examples

library(qcr)
data(pistonrings) 
xbar <- qcs.xbar(pistonrings[1:125,],plot = TRUE)
mu <-xbar$center
std.dev <-xbar$std.dev
LSL=73.99; USL=74.01
qcs.cp(parameters = c(0,0),limits = c(LSL,USL),
      mu = mu,std.dev = std.dev,ylim=c(0,1))
#calculating all the indices
qcs.cp(object = xbar,parameters = c(0,0), limits = c(LSL,USL),ylim=c(0,1))
qcs.cp(object = xbar,parameters = c(1,0), limits = c(LSL,USL),ylim=c(0,1))
qcs.cp(object = xbar,parameters = c(0,1), limits = c(LSL,USL),ylim=c(0,1))
qcs.cp(object = xbar,parameters = c(1,1), limits = c(LSL,USL),ylim=c(0,1))



