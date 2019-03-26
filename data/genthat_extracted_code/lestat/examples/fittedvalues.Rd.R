library(lestat)


### Name: fittedvalues
### Title: Compute Fitted Values for a Linear Model
### Aliases: fittedvalues

### ** Examples

xdata <- simulate(uniformdistribution(), 14)
ydata <- xdata + 4 + simulate(normal(), 14)*0.1
plot(xdata,ydata)
design <- cbind(1, xdata)
lines(xdata, fittedvalues(ydata, design))



