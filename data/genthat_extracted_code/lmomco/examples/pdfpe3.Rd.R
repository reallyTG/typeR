library(lmomco)


### Name: pdfpe3
### Title: Probability Density Function of the Pearson Type III
###   Distribution
### Aliases: pdfpe3
### Keywords: distribution probability density function Distribution:
###   Pearson Type III

### ** Examples

  lmr <- lmoms(c(123,34,4,654,37,78))
  pe3 <- parpe3(lmr)
  x <- quape3(0.5,pe3)
  pdfpe3(x,pe3)
## Not run: 
##D # Demonstrate Pearson Type III between lmomco and PearsonDS
##D qlmomco.pearsonIII <- function(f, para) {
##D    MU    <- para$para[1] # product moment mean
##D    SIGMA <- para$para[2] # product moment standard deviation
##D    GAMMA <- para$para[3] # product moment skew
##D    L <- para$para[1] - 2*SIGMA/GAMMA # location
##D    S <- (1/2)*SIGMA*abs(GAMMA)       # scale
##D    A <- 4/GAMMA^2                    # shape
##D    return(PearsonDS::qpearsonIII(f, A, L, S)) # shape comes first!
##D }
##D FF <- nonexceeds(); para <- vec2par(c(6,.4,.7), type="pe3")
##D plot( FF, qlmomco(FF, para), xlab="Probability", ylab="Quantile", cex=3)
##D lines(FF, qlmomco.pearsonIII(FF, para), col=2, lwd=3) # 
## End(Not run)

## Not run: 
##D # Demonstrate forced Pearson Type III parameter estimation via PearsonDS package
##D para <- vec2par(c(3, 0.4, 0.6), type="pe3"); X <- rlmomco(105, para)
##D lmrpar <- lmom2par(lmoms(X), type="pe3")
##D mpspar <- mps2par(X, type="pe3"); mlepar <- mle2par(X, type="pe3")
##D PDS <- PearsonDS:::pearsonIIIfitML(X) # force function exporting
##D if(PDS$convergence != 0) {
##D   warning("convergence failed"); PDS <- NULL # if null, rerun simulation [new data]
##D } else {
##D   # This is a list() mimic of PearsonDS::pearsonFitML()
##D   PDS   <- list(type=3, shape=PDS$par[1], location=PDS$par[2], scale=PDS$par[3])
##D   skew  <- sign(PDS$shape) * sqrt(4/PDS$shape)
##D   stdev <-    2*PDS$scale  / abs(skew); mu <- PDS$location + 2*stdev/skew
##D   PDS <- vec2par(c(mu,stdev,skew), type="pe3") # lmomco form of parameters
##D }
##D print(lmrpar$para); print(mpspar$para); print(mlepar$para); print(PDS$para)
##D #        mu     sigma     gamma 
##D # 2.9653380 0.3667651 0.5178592 # L-moments (by lmomco, of course)
##D # 2.9678021 0.3858198 0.4238529 # MPS by lmomco
##D # 2.9653357 0.3698575 0.4403525 # MLE by lmomco
##D # 2.9653379 0.3698609 0.4405195 # MLE by PearsonDS
##D # So we can see for this simulation that the two MLE approaches are similar.
## End(Not run)



