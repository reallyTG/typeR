library(FatTailsR)


### Name: kashp
### Title: Kashp Function
### Aliases: kashp dkashp_dx ashp

### ** Examples


require(graphics)

### Example 1
x    <- (-3:3)*3 ; names(x) <- x
kashp(x, k=2)
k    <- c(-2, 0, 1, 2, 3, 5, 10) ; names(k) <- k
outer(x, k, kashp)
outer(x, k, exphp)

### Example 2
xmin   <- -10
xd     <- 0.5
x      <- seq(xmin, -xmin, xd) ; names(x) <- x
k      <- c(0.6, 1, 1.5, 2, 3.2, 10) ; names(k) <- k
olty   <- c(2, 1, 2, 1, 2, 1, 1)
olwd   <- c(1, 1, 2, 2, 3, 4, 2)
ocol   <- c(2, 2, 4, 4, 3, 3, 1)
op     <- par(mfrow = c(2,2), mgp = c(1.5,0.8,0), mar = c(3,3,2,1))

Tkashp <- ts(cbind(outer(x, k, kashp), "x/2" = x/2), start = xmin, deltat = xd)
plot(Tkashp, plot.type = "single", ylim = c(-5, +5), 
       lty = olty, lwd = olwd, col = ocol, xaxs = "i", yaxs = "i", xlab = "", 
       ylab = "", main = "kashp(x, k)" )
legend("topleft", title = expression(kappa), legend = colnames(Tkashp), 
       inset = 0.02, lty = olty, lwd = olwd, col = ocol, cex = 0.7 )

Tdkashp <- ts(cbind(outer(x, k, dkashp_dx)), start = xmin, deltat = xd)
plot(Tdkashp, plot.type = "single", ylim = c(0, 0.8), 
       lty = olty, lwd = olwd, col = ocol, xaxs = "i", yaxs = "i", xlab = "", 
       ylab = "", main="dkashp_dx(x, k)" )
legend("topleft", title = expression(kappa), legend = colnames(Tdkashp), 
       inset = 0.02, lty = olty, lwd = olwd, col = ocol, cex = 0.7 )

Tashp <- ts(cbind(outer(x, k, ashp), "x/2" = x/2), start = xmin, deltat = xd)
plot(Tashp, plot.type = "single", ylim = c(-5, +5), 
       lty = olty, lwd = olwd, col = ocol, xaxs = "i", yaxs = "i", xlab = "", 
       ylab = "", main = "ashp(x, k)" )
legend("topleft", title = expression(kappa), legend = colnames(Tashp), 
       inset = 0.02, lty = olty, lwd = olwd, col = ocol, cex = 0.7 )
### End example 2




