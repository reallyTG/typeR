library(DetMCD)


### Name: plot.DetMCD
### Title: Robust Diagnostic Plots For DetMCD
### Aliases: plot.DetMCD
### Keywords: hplot robust multivariate

### ** Examples

data(Animals, package ="MASS")
brain <- Animals[c(1:24, 26:25, 27:28),]
detmcd <- DetMCD(log(brain))

plot(detmcd, which = "distance", classic = TRUE)# 2 plots
plot(detmcd, which = "dd")
plot(detmcd, which = "tolEllipsePlot", classic = TRUE)
op <- par(mfrow = c(2,3))
plot(detmcd)## -> which = "all" (5 plots)
par(op)



