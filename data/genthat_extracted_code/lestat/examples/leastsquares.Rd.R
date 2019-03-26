library(lestat)


### Name: leastsquares
### Title: Find the Least Squares Solution in a Linear Model
### Aliases: leastsquares

### ** Examples

xdata <- simulate(uniformdistribution(), 14)
ydata <- xdata + 4 + simulate(normal(), 14)*0.1
plot(xdata,ydata)
design <- cbind(1, xdata)
leastsquares(ydata, design)



