library(copBasic)


### Name: sectionCOP
### Title: The Sections or Derivative of the Sections of a Copula
### Aliases: sectionCOP
### Keywords: visualization diagnostics copula section

### ** Examples

## Not run: 
##D # EXAMPLE 1, plot the v=0.55 section and then u=0.55 section, which will overlay
##D # the other because the PSP is a symmetrical copula
##D tmp <- sectionCOP(0.55, cop=PSP, ylab="COPULA SECTIONS",  lwd=5, col=2)
##D tmp <- sectionCOP(0.55, cop=PSP, wrtV=TRUE, ploton=FALSE, lwd=2, col=3)
##D # now add the v=0.85 section and the u=0.85, again overlay each other
##D tmp <- sectionCOP(0.85, cop=PSP, ploton=FALSE,             lwd=5, col=2, lty=2)
##D tmp <- sectionCOP(0.85, cop=PSP, wrtV=TRUE, ploton=FALSE,  lwd=2, col=3, lty=2)#
## End(Not run)

## Not run: 
##D # EXAMPLE 2, v=0.35 section and derivative (the conditional distribution) function
##D tmp <- sectionCOP(0.35, cop=PSP, ylab="COPULA SECTIONS OR DERIV.", lwd=5, col=3)
##D tmp <- sectionCOP(0.35, cop=PSP, dercop=TRUE, ploton=FALSE,               col=3)
##D # The thin green line represents the cumulative distribution function conditional
##D # on u = 0.35 from the derCOP function.  Then see Example 3
## End(Not run)

## Not run: 
##D # EXAMPLE 3 (random selection commented out)
##D #para <- list(cop1=PLACKETTcop,  cop2=PLACKETTcop, alpha=runif(1), beta=runif(1),
##D #             para1=10^runif(1,min=-4, max=0), para2=10^runif(1,min= 0, max=4))
##D para <- list(cop1=PLACKETTcop,  cop2=PLACKETTcop, alpha=0.7, beta=0.22,
##D              para1=0.0155, para2=214.4)
##D txts <- c("Alpha=",    round(para$alpha,    digits=4),
##D           "; Beta=",   round(para$beta,     digits=4),
##D           "; Theta1=", round(para$para1[1], digits=5),
##D           "; Theta2=", round(para$para2[1], digits=2))
##D layout(matrix(1:2,byrow=TRUE))
##D D <- simCOP(n=1000, cop=composite2COP, para=para, cex=0.5, col=rgb(0,0,0,0.2), pch=16)
##D mtext(paste(txts,collapse=""))
##D #f <- c(runif(1),runif(1))
##D f <- c(0.2,0.9) # RED is the horizontal section and BLACK is the vertical section
##D segments(f[1],0,f[1],1, col=2, lwd=2); segments(0,f[2],1,f[2], lwd=2)
##D ftxt <- c("Sections (thick) and derivatives (thin) at ", f, " nonexceed. prob.")
##D tmp <- sectionCOP(f[1],cop=composite2COP,para=para, col=2, lwd=4)
##D tmp <- sectionCOP(f[1],cop=composite2COP,para=para, dercop=TRUE, ploton=FALSE, col=2)
##D tmp <- sectionCOP(f[2],cop=composite2COP,para=para,wrtV=TRUE,ploton=FALSE,lwd=4)
##D tmp <- sectionCOP(f[2],cop=composite2COP,para=para,wrtV=TRUE,ploton=FALSE,dercop=TRUE)
##D mtext(paste(ftxt, collapse=""))
##D # The thin lines are the CDFs conditional on the respective values of "f". Carefully
##D # compare the point densities along and near the sections in the top plot to the
##D # respective shapes of the CDFs in the bottom plot. If the bottom plot were rotated
##D # 90 degrees clockwise and then reflected top to bottom, the conditional quantile
##D # function QDF results. Reflection is needed because, by convention, QDFs are monotonic
##D # increasing to right---functions derCOPinv() and derCOPinv2() provide the CDF inversion.
## End(Not run)



