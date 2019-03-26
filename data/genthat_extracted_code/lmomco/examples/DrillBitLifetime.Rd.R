library(lmomco)


### Name: DrillBitLifetime
### Title: Lifetime of Drill Bits
### Aliases: DrillBitLifetime
### Keywords: datasets

### ** Examples

data(DrillBitLifetime)
summary(DrillBitLifetime)
## Not run: 
##D data(DrillBitLifetime)
##D X     <- DrillBitLifetime$LIFETIME
##D lmr   <- lmoms(X); par <- lmom2par(lmr,  type="gpa")
##D pwm   <- pwmRC(X, threshold=3000); zeta <- pwm$zeta
##D lmrrc <- pwm2lmom(pwm$Bbetas)
##D rcpar <- pargpaRC(lmrrc, zeta=zeta)
##D XBAR  <- lmomgpa(rcpar)$lambdas[1]
##D F <- nonexceeds(); P <- 100*F; x <- seq(min(X), max(X))
##D plot(sort(X), 100*pp(X), xlab="LIFETIME", ylab="PERCENT", xlim=c(1,10000))
##D rug(X, col=rgb(0,0,0,0.5))
##D lines(c(XBAR, XBAR), range(P), lty=2) # mean (expectation of life)
##D lines(cmlmomco(F, rcpar),  P,  lty=2) # conditional mean
##D points(XBAR, 0, pch=16)
##D lines(x, 100*plmomco(x, par),   lwd=2, col=8) # fitted dist.
##D lines(x, 100*plmomco(x, rcpar), lwd=3, col=1) # fitted dist.
##D 
##D lines( rmlmomco(F, rcpar), P,   col=4) # residual mean life
##D lines(rrmlmomco(F, rcpar), P,   col=4, lty=2) # rev. residual mean life
##D lines(x, 1E4*hlmomco(x, rcpar), col=2) # hazard function
##D lines(x, 1E2*lrzlmomco(plmomco(x, rcpar), rcpar), col=3) # Lorenz func.
##D legend(4000, 40,
##D        c("Mean (vertical) or conditional mean (dot at intersect.)",
##D          "Fitted GPA naively to all data",
##D          "Fitted GPA to right-censoring PWMs",
##D          "Residual mean life", "Reversed residual mean life",
##D          "Hazard function x 1E4", "Lorenz curve x 100"
##D         ), cex=0.75,
##D        lwd=c(1, 2, 3, 1, 1, 1, 1), col=c(1, 8, 1, 4, 4, 2, 3),
##D        lty=c(2, 1, 1, 1, 2, 1, 1), pch=rep(NA, 8))
## End(Not run)



