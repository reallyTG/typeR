## ---- eval = TRUE, fig.align='center'------------------------------------
# load data
data("Ross76")
# plot
tin <- Ross76[,1]
data <- Ross76[,2:4]
plot(tin, data[,1], xlab = 't', ylab = 'x(t)', main = 'Original time series',
     type='l', col = 'gray')

## ---- eval = TRUE, fig.align='center'------------------------------------
plot(tin, data[,1], xlab = 't', ylab = 'x(t)', 
     main = 'Subsampled time series', type='l', col = 'gray')
# subsampling:
Ross76us <- Ross76[seq(1,4000,by=50),]
# plot
tus <- Ross76us[,1]
datus <- Ross76us[,2:4]
lines(tus, datus[,1], type='p', col='red', cex = 0.6)
lines(tus, datus[,1], type='l', col='red')
legend(0,6.5,c("original", "subsampled"), col=c('gray', 'red'),
       lty=c(1,1), pch=c(NA,1), cex=0.6)


## ---- eval = TRUE, fig.align='center'------------------------------------
plot(tin, data[,1], xlab = 't', ylab = 'x(t)', 
     main = 'Resampled time series', type='l', col = 'lightgray')
# subsampling:
Ross76us <- Ross76[seq(1,4000,by=50),]
# plot
tus <- Ross76us[,1]
datus <- Ross76us[,2:4]
lines(tus, datus[,1], type='p', col='red', cex = 0.6)
lines(tus, datus[,1], type='l', col='red')
#
xout <- seq(min(tus), max(tus), by = 0.01)
rspl <- spline(tus, y = datus[,1], method = "fmm", xout = xout)
# plot resampled
lines(rspl$x, rspl$y, type='l', col='green')
legend(0,6.5,c("original", "subsampled", "resampled"),
       col=c('lightgray', 'red', 'green'), lty=c(1,1,1),
       pch=c(NA,1, NA), cex=0.6)

## ---- eval = TRUE, fig.align='center'------------------------------------
# from original signal
drv1 <- drvSucc(tin, data[,1], nDeriv=2)
# from subsampled signal
drv2 <- drvSucc(tus, datus[,1], nDeriv=2)
# from resampled signal
drv3 <- drvSucc(rspl$x, rspl$y, nDeriv=2)

## ---- eval = TRUE, fig.show='hold', fig.align='center'-------------------
# plot resulting output as a function of time
# first derivative
plot(drv1$tout, drv1$seriesDeriv[,2], type='l', xlab = 'time', 
     ylab= expression(dx/dt))
lines(drv2$tout, drv2$seriesDeriv[,2], type='p', cex = 0.6, col = 'red')
lines(drv3$tout, drv3$seriesDeriv[,2], type='l', col = 'green')
legend(0,-5,c("original", "subsampled", "resampled"), 
       col=c('black', 'red', 'green'), lty=c(1,NA,1), pch=c(NA,1, NA), cex=0.6)
# second derivative
plot(drv1$tout, drv1$seriesDeriv[,3], type='l', xlab = 'time', 
     ylab= expression(d^2*x/dt^2))
lines(drv2$tout, drv2$seriesDeriv[,3], type='p', cex = 0.6, col = 'red')
lines(drv3$tout, drv3$seriesDeriv[,3], type='l', col = 'green')
legend(0,-10,c("original", "subsampled", "resampled"), 
       col=c('black', 'red', 'green'), lty=c(1,NA,1), pch=c(NA,1, NA), cex=0.6)

## ---- eval = TRUE, fig.show='hold', fig.align='center', fig.width=4, fig.height=4----
# output variable (smoothed) and its derivatives
plot(drv1$seriesDeriv[,1], drv1$seriesDeriv[,2], type='l', xlab = 'x(t)', 
     ylab= expression(dx/dt))
lines(drv2$seriesDeriv[,1], drv2$seriesDeriv[,2], type='l', col = 'red')
lines(drv3$seriesDeriv[,1], drv3$seriesDeriv[,2], type='l', col = 'green')
legend(-3,-5,c("original", "subsampled", "resampled"), 
       col=c('black', 'red', 'green'), lty=1, cex=0.5)
# second derivative
plot(drv1$seriesDeriv[,2], drv1$seriesDeriv[,3], type='l', xlab = 'dx(t)/dt', 
     ylab= expression(d^2*x/dt^2))
lines(drv2$seriesDeriv[,2], drv2$seriesDeriv[,3], type='l', col = 'red')
lines(drv3$seriesDeriv[,2], drv3$seriesDeriv[,3], type='l', col = 'green')
legend(1.3,18,c("original", "subsampled", "resampled"), 
       col=c('black', 'red', 'green'), lty=1, cex=0.5)

## ---- eval = TRUE, fig.align='center'------------------------------------
# load
data("Ross76")
# plot
tin <- Ross76[,1]
data <- Ross76[,2:4]
plot(tin, data[,1], ylim = c(-6.5,12), xlab = 'time', ylab = '', type='l', col='blue')
lines(tin, data[,2], type='l',  col='orange')
lines(tin, data[,3], type='l',  col='brown')
legend(35,12,c("x(t)", "y(t)", "z(t)"), col=c('blue', 'orange', 'brown'), lty=1, cex=0.8)

## ---- eval = TRUE, fig.show='hold', fig.align='center', fig.width=4, fig.height=4----
plot(data[,1], data[,2], type='l', xlab = 'x(t)', ylab = 'y(t)')

## ---- eval = TRUE, fig.show='hold', fig.align='center', fig.width=4, fig.height=4----
plot(data[,2], data[,3], type='l', xlab = 'x(t)', ylab = 'z(t)')

## ---- eval = TRUE, fig.align='center'------------------------------------
# plot
tin <- Ross76[,1]
data <- Ross76[,2:4]
plot(tin, data[,1], ylim = c(-6.5,12), type='l', col='lightgray', xlab = 'time', ylab = '')
lines(tin, data[,2], type='l',  col='lightgray')
lines(tin, data[,3], type='l',  col='lightgray')

# subsampled data
#
# subsampling:
Ross76us <- Ross76[seq(1,4000,by=75),]
# plot
tus <- Ross76us[,1]
datus <- Ross76us[,2:4]
lines(tus, datus[,1], type='p', cex = 0.5, col='blue')
lines(tus, datus[,2], type='p', cex = 0.5, col='orange')
lines(tus, datus[,3], type='p', cex = 0.5, col='brown')
legend(35,12,c("x(t)", "y(t)", "z(t)"), col=c('blue', 'orange', 'brown'), pch=1, cex=0.8)


## ---- eval = TRUE, fig.show='hold', fig.align='center', fig.width=4, fig.height=4----
xout <- seq(min(tus), max(tus), by = 0.01)
rsplx <- spline(tus, y = datus[,1], method = "fmm", xout = xout)
rsply <- spline(tus, y = datus[,2], method = "fmm", xout = xout)
rsplz <- spline(tus, y = datus[,3], method = "fmm", xout = xout)
# plot resampled
plot(data[,1], data[,2], type='l', xlab = 'x(t)', ylab = 'y(t)')
lines(rsplx$y, rsply$y, type='l', col='green')
legend(3.5,2,c("original", "resampled"), col=c('black', 'green'), lty=1, cex=0.5)
plot(data[,2], data[,3], type='l', xlab = 'x(t)', ylab = 'z(t)')
lines(rsply$y, rsplz$y, type='l', col='green')
legend(-0.5,12,c("original", "resampled"), col=c('black', 'green'), lty=1, cex=0.5)


## ---- eval = TRUE, fig.align='center', fig.align='center', fig.width=4, fig.height=4----
# derivatives
# from original signal
drv1x <- drvSucc(tin, data[,1], nDeriv=2)
drv1y <- drvSucc(tin, data[,2], nDeriv=2)
drv1z <- drvSucc(tin, data[,3], nDeriv=2)
# from resampled signal
drv3x <- drvSucc(rsplx$x, rsplx$y, nDeriv=2)
drv3y <- drvSucc(rsply$x, rsply$y, nDeriv=2)
drv3z <- drvSucc(rsplz$x, rsplz$y, nDeriv=2)
# phase portraits plot for y:
# (y, dy/dt) projection of the original signal (in black) and resampled signal (in green)
plot(drv1y$seriesDeriv[,1], drv1y$seriesDeriv[,2], type='l', xlab = 'y', ylab = 'dy/dt')
lines(drv3y$seriesDeriv[,1], drv3y$seriesDeriv[,2], type='l', col='green')
legend(0,-3,c("original", "resampled"), col=c('black', 'green'), lty=1, cex=0.5)


## ---- eval = TRUE, fig.show='hold', fig.align='center', fig.width=4, fig.height=4----
# phase portraits plot for x and z:
# (x, dx/dt) projection of the original signal (in black) and resampled signal (in green)
plot(drv1x$seriesDeriv[,1], drv1x$seriesDeriv[,2], type='l', xlab = 'x', ylab = 'dx/dt')
lines(drv3x$seriesDeriv[,1], drv3x$seriesDeriv[,2], type='l', col='green')
legend(-3,-5,c("original", "resampled"), col=c('black', 'green'), lty=1, cex=0.5)

# phase portraits plots
# (z, dz/dt) projection of the original signal (in black) and resampled signal (in green)
plot(drv1z$seriesDeriv[,1], drv1z$seriesDeriv[,2], type='l', xlab = 'z', ylab = 'dz/dt')
lines(drv3z$seriesDeriv[,1], drv3z$seriesDeriv[,2], type='l', col='green')
legend(0,-10,c("original", "resampled"), col=c('black', 'green'), lty=1, cex=0.5)


