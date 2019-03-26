library(FatTailsR)


### Name: exphp
### Title: Power Hyperbolas and Power Hyperbolic Functions
### Aliases: exphp coshp sinhp tanhp sechp cosechp cotanhp

### ** Examples


### Example 1
x  <- (-3:3)*3 
exphp(x, k = 4)
coshp(x, k = 4)
sinhp(x, k = 4) 
tanhp(x, k = 4)

### Example 2 outer + plot(exphp, coshp, sinhp, tanhp)
xmin  <- -10
xd    <- 0.5
x     <- seq(xmin, -xmin, xd) ; names(x) <- x
k     <- c(0.6, 1, 1.5, 2, 3.2, 10) ; names(k) <- k
olty  <- c(2, 1, 2, 1, 2, 1, 1)
olwd  <- c(1, 1, 2, 2, 3, 4, 2)
ocol  <- c(2, 2, 4, 4, 3, 3, 1)
op    <- par(mfrow = c(2,2), mgp = c(1.5,0.8,0), mar = c(3,3,2,1))

## exphp(x, k)
Texphp <- ts(cbind(outer(-x, k, exphp), "exp(-x/2)" = exp(-x/2)), 
             start = xmin, deltat = xd)
plot(Texphp, plot.type = "single", ylim = c(0,20), 
       lty = olty, lwd = olwd, col = ocol, xaxs = "i", yaxs = "i", xlab = "", 
       ylab = "", main = "exphp(-x, k)" )
legend("topright", title = expression(kappa), legend = colnames(Texphp), 
       inset = 0.02, lty = olty, lwd = olwd, col = ocol, cex = 0.7 )

## coshp(x, k)
Tcoshp <- ts(cbind(outer(x, k, coshp), "cosh(x/2)" = cosh(x/2)), 
             start = xmin, deltat = xd)
plot(Tcoshp, plot.type = "single", ylim = c(0,20), 
       lty = olty, lwd = olwd, col = ocol, xaxs = "i", yaxs = "i", 
       xlab = "", ylab = "", main = "coshp(x, k)" )
legend("top", title = expression(kappa), legend = colnames(Tcoshp), 
       inset = 0.02, lty = olty, lwd = olwd, col = ocol, cex = 0.7 )

## sinhp(x, k)
Tsinhp <- ts(cbind(outer(x, k, sinhp), "sinh(x/2)" = sinh(x/2)), 
             start = xmin, deltat=xd)
plot(Tsinhp, plot.type = "single", ylim = c(-10,10), 
       lty = olty, lwd = olwd, col = ocol, xaxs = "i", yaxs = "i", 
       xlab = "", ylab = "", main = "sinhp(x, k)" )
legend("topleft", title = expression(kappa), legend = colnames(Tsinhp), 
       inset = 0.02, lty = olty, lwd=  olwd, col = ocol, cex = 0.7 )

## tanhp(x, k)
Ttanhp <- ts(cbind(outer(x, k, tanhp), "tanh(x/2)" = tanh(x/2)), 
             start = xmin, deltat = xd)
plot(Ttanhp, plot.type = "single", ylim = c(-1,1), 
       lty = olty, lwd = olwd, col = ocol, xaxs = "i", yaxs = "i", xlab = "", 
       ylab = "", main = "tanhp(x, k)" )
legend("topleft", title = expression(kappa), legend = colnames(Ttanhp), 
       inset = 0.02, lty = olty, lwd = olwd, col = ocol, cex = 0.7 )
### End Example 3




