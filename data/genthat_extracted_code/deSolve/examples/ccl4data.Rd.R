library(deSolve)


### Name: ccl4data
### Title: Closed Chamber Study of CCl4 Metabolism by Rats.
### Aliases: ccl4data
### Keywords: datasets

### ** Examples

plot(ChamberConc ~ time, data = ccl4data, xlab = "Time (hours)",
  xlim = range(c(0, ccl4data$time)),
  ylab = "Chamber Concentration (ppm)", log = "y")
ccl4data.avg <- aggregate(ccl4data$ChamberConc,
                  by = ccl4data[c("time", "initconc")], mean)
points(x ~ time, data = ccl4data.avg, pch = 16)                        



