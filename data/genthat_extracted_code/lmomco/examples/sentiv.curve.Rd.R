library(lmomco)


### Name: sentiv.curve
### Title: Compute the Sensitivity Curve for a Single Quantile
### Aliases: sentiv.curve
### Keywords: order statistics (misc.) Sensitivity curve Graphics

### ** Examples

## Not run: 
##D set.seed(50)
##D mean <- 12530; lscale <- 5033; lskew <- 0.4
##D n <- 46; type <- "gev"; lmr <- vec2lmom(c(mean,lscale,lskew))
##D F <- 0.90 # going to explore sensitivity on the 90th percentile
##D par.p <- lmom2par(lmr, type=type) # Parent distribution
##D TRUE.Q <- par2qua(F, par.p)
##D X <- sort(rlmomco(n, par.p)) # Simulate a small sample
##D par.s <- lmom2par(lmoms(X), type=type) # Now fit the distribution
##D SIM.Q <- par2qua(F, par.s); SIM.BAR <- par2lmom(par.s)$lambdas[1]
##D D <- log10(mean) - log10(lscale)
##D R <- as.integer(log10(mean)) + c(-D, D) # need some x-values to explore
##D Xs <- 10^(seq(R[1], R[2], by=.01)) # x-values to explore
##D # Sample estimate are the "parent" only to mimic a more real-world setting.
##D # where one "knows" the form of the parent but perhaps not the parameters.
##D SC1 <- sentiv.curve(F, Xs, data=X, para=par.s, method="bootstrap")
##D SC2 <- sentiv.curve(F, Xs, data=X, para=par.s, method="polynomial",
##D                               bound.type="Carv")
##D SC3 <- sentiv.curve(F, Xs, data=X, para=par.s, method="none")
##D xlim <- range(c(Xs,SC1$Tnp1,SC2$Tnp1,SC3$Tnp1))
##D ylim <- range(c(SC1$curve.perchg, SC2$curve.perchg, SC3$curve.perchg))
##D plot(xlim, c(0,0), type="l", lty=2, ylim=ylim, xaxs="i", yaxs="i",
##D      xlab=paste("Magnitude of next value added to sample of size",n),
##D      ylab=paste("Percent change fitted",F,"probability quantile"))
##D mtext(paste("Distribution",par.s$type,"with parameters",
##D       paste(round(par.s$para, digits=3), collapse=", ")))
##D lines(rep(TRUE.Q,  2), c(-10,10), lty=4, lwd=3)
##D lines(rep(SIM.BAR, 2), c(-10,10), lty=3, lwd=2)
##D lines(rep(SIM.Q,   2), c(-10,10), lty=2)
##D lines(Xs, SC1$curve.perchg, lwd=3, col=1)
##D lines(Xs, SC2$curve.perchg, lwd=2, col=2)
##D lines(Xs, SC3$curve.perchg, lwd=1, col=4)
##D rug(SC1$Tnp1, col=rgb(0,0,0,0.3))
##D rug(SC2$Tnp1, col=rgb(1,0,0,0.3))
##D rug(SC3$Tnp1, col=rgb(0,0,1,0.3), tcl=-.75) #
## End(Not run)



