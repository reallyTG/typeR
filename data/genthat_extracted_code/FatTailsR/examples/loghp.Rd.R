library(FatTailsR)


### Name: loghp
### Title: Inverse Power Hyperbolas and Inverse Power Hyperbolic Functions
### Aliases: loghp acoshp asinhp atanhp asechp acosechp acotanhp

### ** Examples


### Example 1 (acoshp, asinhp, atanhp)
 loghp( c(ppoints(10), 1, 1/rev(ppoints(10))), k = 2)
acoshp( 1:10, k = 2)
asinhp( -5:5, k = 2)
atanhp( seq(-1, 1, by = 0.1), k = 2)
asechp( ppoints(20), k = 2)
acosechp( -5:5, k = 2)
acotanhp( c( -1/ppoints(10), 1/rev(ppoints(10))), k = 2)

x  <- (-3:3)*3 
 loghp(exphp(x, k = 4), k = 4)
acoshp(coshp(x, k = 4), k = 4)
asinhp(sinhp(x, k = 4), k = 4)
atanhp(tanhp(x, k = 4), k = 4)


### Example 2 (loghp, acoshp, asinhp, atanhp)
k     <- c(0.6, 1, 1.5, 2, 3.2, 10) ; names(k) <- k
olty  <- c(2, 1, 2, 1, 2, 1, 1)
olwd  <- c(1, 1, 2, 2, 3, 4, 2)
ocol  <- c(2, 2, 4, 4, 3, 3, 1)
op    <- par(mfrow = c(2, 2), mgp = c(1.5, 0.8, 0), mar = c(3, 3, 2, 1))

xld     <- 0.05
xl      <- seq(0.05, 20, xld) ; names(xl) <- xl
Tlcoshp <- ts(cbind(outer(xl, k, loghp), "2*log(x)" = 2*log(xl)), 
              start = xl[1], deltat = xld)
plot(Tlcoshp, plot.type = "single", xlim = c(0,20), ylim = c(-5,15), 
     lty = olty, lwd = olwd, col = ocol, xaxs = "i", yaxs = "i", 
     xlab="", ylab = "", main = "loghp(x, k)" )
legend("bottomright", title = expression(kappa), legend = colnames(Tlcoshp), 
     inset = 0.02, lty = olty, lwd = olwd, col = ocol, cex = 0.7 )

## acoshp(x, k)
xcd     <- 0.5
xc      <- seq(1, 20, xcd) ; names(xc) <- xc
Tacoshp <- ts(cbind(outer(xc, k, acoshp), "2*acosh(x)" = 2*acosh(xc)), 
              start = xc[1], deltat = xcd)
plot(Tacoshp, plot.type = "single", ylim = c(0,15), lty = olty, lwd = olwd, col = ocol,
        xaxs = "i", yaxs = "i", xlab = "", ylab = "", main = "acoshp(x, k)" )
legend("bottomright", title = expression(kappa), legend = colnames(Tacoshp), 
        inset = 0.02, lty = olty, lwd = olwd, col = ocol, cex = 0.7 )

## asinhp(x, k)
xsd     <- 0.5
xs      <- seq(-10, 10, xsd) ; names(xs) <- xs
Tasinhp <- ts(cbind(outer(xs, k, asinhp), "2*asinh(x)" = 2*asinh(xs)), 
              start = xs[1], deltat = xsd)
plot(Tasinhp, plot.type = "single", ylim = c(-10,10), lty = olty, lwd = olwd, col = ocol,
        xaxs = "i", yaxs = "i", xlab = "", ylab = "", main = "asinhp(x, k)" )
legend("topleft", title = expression(kappa), legend = colnames(Tasinhp), 
        inset = 0.02, lty = olty, lwd = olwd, col = ocol, cex = 0.7 )

## atanhp(x, k)
xtd     <- 0.01
xt      <- seq(-1, 1, xtd) ; names(xt) <- xt
Tatanhp <- ts(cbind(outer(xt, k, atanhp), "2*atanh(x)" = 2*atanh(xt)), 
              start = xt[1], deltat = xtd)
plot(Tatanhp, plot.type = "single", ylim = c(-10,10), lty = olty, lwd = olwd, col = ocol,
        xaxs = "i", yaxs = "i", xlab = "", ylab = "", main = "atanhp(x, k)" )
legend("topleft", title = expression(kappa), legend = colnames(Tatanhp), 
        inset = 0.02, lty = olty, lwd = olwd, col = ocol, cex = 0.7 )
### End Example 2





