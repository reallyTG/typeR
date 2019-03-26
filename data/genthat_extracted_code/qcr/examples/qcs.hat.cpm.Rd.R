library(qcr)


### Name: qcs.hat.cpm
### Title: Process capability indice (estimate cpm)
### Aliases: qcs.hat.cpm

### ** Examples

library(qcr)
data(pistonrings) 
xbar <- qcs.xbar(pistonrings[1:125,],plot = TRUE)
mu <-xbar$center
std.dev <-xbar$std.dev
LSL=73.99; USL=74.01
qcs.hat.cpm(limits = c(LSL,USL),
           mu = mu,std.dev = std.dev,ylim=c(0,1))
qcs.hat.cpm(object = xbar, limits = c(LSL,USL),ylim=c(0,1))



