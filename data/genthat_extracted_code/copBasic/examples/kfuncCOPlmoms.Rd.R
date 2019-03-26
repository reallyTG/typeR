library(copBasic)


### Name: kfuncCOPlmoms
### Title: The L-moments of the Kendall Function of a Copula
### Aliases: kfuncCOPlmoms kfuncCOPlmom
### Keywords: copula (characteristics) Kendall Function (L-moments)
###   L-moments

### ** Examples

## Not run: 
##D kfuncCOPlmom(1, cop=P) # 0.5 * 0.5 = 0.25 is expected joint prob. of independence
##D #[1] 0.2499999  (in agreement with theory)
##D 
##D ls.str(kfuncCOPlmoms(cop=GHcop, para=4.21)) # Gumbel-Hougaard copula
##D # lambdas :  num [1:5] 0.440617 0.169085 0.011228 -0.000797 0.000249
##D # ratios  :  num [1:5]       NA 0.38375  0.0664   -0.00472  0.00147
##D # source  :  chr "kfuncCOPlmoms"  # e.g. L-skew = 0.0664
## End(Not run)

## Not run: 
##D UV <- simCOP(200, cop=PLcop, para=1/pi, graphics=FALSE)
##D theta <- PLpar(UV[,1], UV[,2]); zs <- seq(0.01,0.99, by=.01) # for later
##D 
##D # Take the sample estimated parameter and convert to joint probabilities Z
##D # Convert the Z to the Kendall Function estimates again with the sample parameter
##D Z  <- PLcop(UV[,1], UV[,2], para=theta); KF <- kfuncCOP(Z, cop=PLcop, para=theta)
##D 
##D # Compute L-moments of the "Kendall function" and the sample versions
##D # Note again though that the L-moment are for the distribution of the Z!
##D KNFlmr <- kfuncCOPlmoms(cop=PLcop, para=theta); SAMlmr <- lmomco::lmoms(Z)
##D knftxt <- paste0("Kendall L-moments: ",
##D                  paste(round(KNFlmr$lambdas, digits=4), collapse=", "))
##D samtxt <- paste0("Sample L-moments: " ,
##D                  paste(round(SAMlmr$lambdas, digits=4), collapse=", "))
##D 
##D plot(Z, KF, xlim=c(0,1), ylim=c(0,1), lwd=0.8, col=1,
##D      xlab="COPULA(u,v) VALUE [JOINT PROBABILITY]",
##D      ylab="KENDALL FUNCTION, AS NONEXCEEDANCE PROBABILITY")
##D rug(Z,  side=1, col=2, lwd=0.2); rug(KF, side=2, col=2, lwd=0.2) # rug plots
##D lines(zs, kfuncCOP(zs, cop=PLcop, para=1/pi), col=3)
##D knf_meanZ <- KNFlmr$lambdas[1]; sam_meanZ <- SAMlmr$lambdas[1]
##D knf_mean  <- kfuncCOP(knf_meanZ, cop=PLcop, para=theta) # theo. Kendall function
##D sam_mean  <- kfuncCOP(sam_meanZ, cop=PLcop, para=theta) # sam. est. of Kendall func
##D points(knf_meanZ, knf_mean, pch=16, col=4, cex=4) # big blue dot
##D points(sam_meanZ, sam_mean, pch=16, col=5, cex=2) # smaller pale blue dot
##D lines(zs, zs-zs*log(zs), lty=2, lwd=0.8) # dash ref line for independence
##D text(0.2, 0.30, knftxt, pos=4, cex=0.8); text(0.2, 0.25, samtxt, pos=4, cex=0.8)
##D text(0.2, 0.18, paste0("Note the uniform distribution of the ",
##D                        "vertical axis rug."), cex=0.7, pos=4) #
## End(Not run)



