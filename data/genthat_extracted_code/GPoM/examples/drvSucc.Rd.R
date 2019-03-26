library(GPoM)


### Name: drvSucc
### Title: drvSucc : Computes the successive derivatives of a time series
### Aliases: drvSucc

### ** Examples

#############
# Example 1 #
#############
# Generate a time series:
tin <- seq(0, 5, by = 0.01)
data <- 2 * sin(5*tin)
dev.new()
par(mfrow = c(3, 1))
# Compute its derivatives:
drv <- drvSucc(tin = tin, nDeriv = 2, serie = data, winL = 5)
#
# plot original and filtered series
plot(tin, data, type='l', col = 'black', xlab = 't', ylab = 'x(t)')
lines(drv$tout, drv$seriesDeriv[,1], lty = 3, lwd = 3, col = 'green')
#
# analytic 1st derivative
firstD <- 10 * cos(5 * tin)
# plot both
plot(tin, firstD, type = 'l', col = 'black', xlab = 't', ylab = 'dx/dt')
lines(drv$tout, drv$seriesDeriv[,2], lty = 3, lwd = 3, col = 'green')
#
# analytic 2nd derivative
scdD <- -50 * sin(5 * tin)
# plot both
plot(tin, scdD, type = 'l', col = 'black', xlab = 't', ylab = 'd2x/dt2')
lines(drv$tout, drv$seriesDeriv[,3], lty=3, lwd = 3, col = 'green')

#############
# Example 2 #
#############
# load data:
data("Ross76")
tin <- Ross76[,1]
data <- Ross76[,2]

# Compute the derivatives
drvOut <- drvSucc(tin, data, nDeriv=4)
dev.new()
par(mfrow = c(3, 1))
# original and smoothed variable:
plot(drvOut$tin, drvOut$serie,
     type='p', cex = 1, xlab = 'time', ylab = 'x(t)')
lines(drvOut$tout, drvOut$seriesDeriv[,1], type='p', col='red')
lines(drvOut$tout, drvOut$seriesDeriv[,1], type='l', col='red')
# 1st derivative:
plot(drvOut$tout, drvOut$seriesDeriv[,2],
     type='p', col='red', xlab = 'time', ylab = 'dx(t)/dt')
lines(drvOut$tout, drvOut$seriesDeriv[,2], type='l', col='red')
# 2nd derivative:
plot(drvOut$tout, drvOut$seriesDeriv[,3],
     type='p', col='red', xlab = 'time', ylab = 'd2x(t)/dt2')
lines(drvOut$tout, drvOut$seriesDeriv[,3], type='l', col='red')




