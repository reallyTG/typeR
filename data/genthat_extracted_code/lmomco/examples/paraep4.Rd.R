library(lmomco)


### Name: paraep4
### Title: Estimate the Parameters of the 4-Parameter Asymmetric
###   Exponential Power Distribution
### Aliases: paraep4
### Keywords: distribution (parameters) Distribution: Asymmetric
###   Exponential Power

### ** Examples

# As a general rule AEP4 optimization can be CPU intensive

## Not run: 
##D lmr <- vec2lmom(c(305, 263, 0.815, 0.631))
##D plotlmrdia(lmrdia()); points(lmr$ratios[3], lmr$ratios[4], pch=16, cex=3)
##D PAR <- paraep4(lmr, snap.tau4=TRUE) # will just miss the default eps
##D FF <- nonexceeds(sig6=TRUE)
##D plot(FF, quaaep4(FF, PAR), type="l", log="y")
##D lmomaep4(PAR) # 305, 263, 0.8150952, 0.6602706 (compare to those in lmr) 
## End(Not run)

## Not run: 
##D PAR <- list(para=c(100, 1000, 1.7, 1.4), type="aep4")
##D lmr <- lmomaep4(PAR)
##D aep4 <- paraep4(lmr, method="ADG")
##D print(aep4) # 
## End(Not run)

## Not run: 
##D PARdg  <- paraep4(lmr, method="DG")
##D PARasq <- paraep4(lmr, method="A")
##D print(PARdg)
##D print(PARasq)
##D F <- c(0.001, 0.005, seq(0.01,0.99, by=0.01), 0.995, 0.999)
##D qF <- qnorm(F)
##D ylim <- range( quaaep4(F, PAR), quaaep4(F, PARdg), quaaep4(F, PARasq) )
##D plot(qF, quaaep4(F, PARdg), type="n", ylim=ylim,
##D      xlab="STANDARD NORMAL VARIATE", ylab="QUANTILE")
##D lines(qF, quaaep4(F, PAR), col=8, lwd=10) # the true curve
##D lines(qF, quaaep4(F, PARdg),  col=2, lwd=3)
##D lines(qF, quaaep4(F, PARasq), col=3, lwd=2, lty=2)
##D # See how the red curve deviates, Delicado and Goria failed
##D # and the ifail attribute in PARdg is TRUE. Note for lmomco 2.3.1+
##D # that after movement to log-exp transform to the parameters during
##D # optimization that this "error" as described does not appear to occur.
##D 
##D print(PAR$para)
##D print(PARdg$para)
##D print(PARasq$para)
##D 
##D ePAR1dg <- abs((PAR$para[1] - PARdg$para[1])/PAR$para[1])
##D ePAR2dg <- abs((PAR$para[2] - PARdg$para[2])/PAR$para[2])
##D ePAR3dg <- abs((PAR$para[3] - PARdg$para[3])/PAR$para[3])
##D ePAR4dg <- abs((PAR$para[4] - PARdg$para[4])/PAR$para[4])
##D 
##D ePAR1asq <- abs((PAR$para[1] - PARasq$para[1])/PAR$para[1])
##D ePAR2asq <- abs((PAR$para[2] - PARasq$para[2])/PAR$para[2])
##D ePAR3asq <- abs((PAR$para[3] - PARasq$para[3])/PAR$para[3])
##D ePAR4asq <- abs((PAR$para[4] - PARasq$para[4])/PAR$para[4])
##D 
##D MADdg  <- mean(ePAR1dg,  ePAR2dg,  ePAR3dg,  ePAR4dg)
##D MADasq <- mean(ePAR1asq, ePAR2asq, ePAR3asq, ePAR4asq)
##D 
##D # We see that the Asquith method performs better for the example
##D # parameters in PAR and inspection of the graphic will show that
##D # the Delicado and Goria solution is obviously off. (See Note above)
##D print(MADdg)
##D print(MADasq)
##D 
##D # Repeat the above with this change in parameter to
##D # PAR <- list(para=c(100, 1000, .7, 1.4), type="aep4")
##D # and the user will see that all three methods converged on the
##D # correct values. 
## End(Not run)



