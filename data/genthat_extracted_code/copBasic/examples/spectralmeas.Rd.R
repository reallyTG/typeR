library(copBasic)


### Name: spectralmeas
### Title: Estimation of the Spectral Measure
### Aliases: spectralmeas
### Keywords: copula (goodness-of-fit) copula (inference) inference
###   spectral measure inference goodness-of-fit API to the copula package
###   package copula (comparison to)

### ** Examples

## Not run: 
##D UV <- simCOP(n=500, cop=HRcop, para=1.3, graphics=FALSE)
##D W <- seq(0,1,by=0.005)
##D Hu <- spectralmeas(UV, w=W)
##D Hs <- spectralmeas(UV, w=W, smooth=TRUE, nu=100)
##D plot(W,Hu, type="l", ylab="Spectral Measure H", xlab="Angle")
##D lines(W, Hs, col=2) # 
## End(Not run)

## Not run: 
##D "GAUScop" <- function(u,v, para=NULL, ...) {
##D   if(length(u)==1) u<-rep(u,length(v)); if(length(v)==1) v<-rep(v,length(u))
##D   return(copula::pCopula(matrix(c(u,v), ncol=2), para))
##D }
##D GAUSparfn <- function(rho) return(copula::normalCopula(rho, dim = 2))
##D n <- 2000 # The PSP parent has no upper tail dependency
##D uv    <- simCOP(n=n, cop=PSP,      para=NULL, graphics=FALSE)
##D PLpar <- mleCOP(uv,  cop=PLcop,    interval=c(0,100))$para
##D PLuv  <- simCOP(n=n, cop=PLcop,    para=PLpar, graphics=FALSE)
##D GApar <- mleCOP(uv,  cop=GAUScop,  parafn=GAUSparfn, interval=c(-1,1))$para
##D GAuv  <- simCOP(n=n, cop=GAUScop,  para=GApar, graphics=FALSE)
##D GLpar <- mleCOP(uv,  cop=GLcop,    interval=c(0,100))$para
##D GLuv  <- simCOP(n=n, cop=GLcop,    para=GLpar, graphics=FALSE)
##D FF <- c(0.001,seq(0.005,0.995, by=0.005),0.999); qFF <- qnorm(FF)
##D f <- 0.90 # Seeking beyond the 90th percentile pseudo-polar radius
##D PSPh <- spectralmeas(  uv, w=FF, f=f, smooth=TRUE, snv=TRUE)
##D PLh  <- spectralmeas(PLuv, w=FF, f=f, smooth=TRUE, snv=TRUE)
##D GAh  <- spectralmeas(GAuv, w=FF, f=f, smooth=TRUE, snv=TRUE)
##D GLh  <- spectralmeas(GLuv, w=FF, f=f, smooth=TRUE, snv=TRUE)
##D plot(qFF, PSPh, type="l", lwd=2, xlim=c(-3,3), ylim=c(-2,2),
##D      xlab="STANDARD NORMAL VARIATE OF PSEUDO-POLAR ANGLE",
##D      ylab="STANDARD NORMAL VARIATE OF SPECTRAL MEASURE PROBABILITY")
##D lines(qFF, PLh, col=2) #  red  line is the Plackett copula
##D lines(qFF, GAh, col=3) # green line is the Gaussian copula
##D lines(qFF, GLh, col=4) #  blue line is the Galambos copula
##D # Notice the flat spot and less steep nature of the PSP (black line), which is
##D # indicative of no to even spreading tail dependency. The Plackett and Gaussian
##D # copulas show no specific steepening near the middle, which remains indicative
##D # of no tail dependency with the Plackett being less steep because it has a more
##D # dispersed copula density at the right tail is approached than the Gaussian.
##D # The Galambos copula has upper tail dependency, which is seen by
##D # the mass concentration and steepening of the curve on the plot.
## End(Not run)



