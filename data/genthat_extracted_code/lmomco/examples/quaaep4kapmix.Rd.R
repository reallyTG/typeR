library(lmomco)


### Name: quaaep4kapmix
### Title: Quantile Function Mixture Between the 4-Parameter Asymmetric
###   Exponential Power and Kappa Distributions
### Aliases: quaaep4kapmix
### Keywords: quantile function quantile mixture function distribution
###   (mixture) Distribution: Kappa Distribution: Asymmetric Exponential
###   Power

### ** Examples

## Not run: 
##D FF <- c(0.0001, 0.0005, 0.001, seq(0.01,0.99, by=0.01), 0.999,
##D        0.9995, 0.9999); Z <- qnorm(FF)
##D t3s <- seq(0, 0.5, by=0.1); T4step <- 0.02
##D pdf("mixture_test.pdf")
##D for(t3 in t3s) {
##D    T4low <- (5*t3^2 - 1)/4; T4kapup <- (5*t3^2 + 1)/6
##D    t4s <- seq(T4low+T4step, T4kapup+2*T4step, by=T4step)
##D    for(t4 in t4s) {
##D       lmr <- vec2lmom(c(0,1,t3,t4)) # make L-moments for lmomco
##D       if(! are.lmom.valid(lmr)) next # for general protection
##D       kap  <- parkap(lmr)
##D       if(kap$ifail == 5) next # avoid further work if numeric problems
##D       aep4 <- paraep4(lmr, method="A")
##D       X <- quaaep4kapmix(FF, lmr)
##D       if(is.null(X)) next # one last protection
##D       plot(Z, X, type="l", lwd=5, col=1, ylim=c(-15,15),
##D            xlab="STANDARD NORMAL VARIATE",
##D            ylab="VARIABLE VALUE")
##D       mtext(paste("L-skew =",lmr$ratios[3],
##D                   "  L-kurtosis = ",lmr$ratios[4]))
##D       # Now add two more quantile functions for reference and review
##D       # of the mixture. These of course would not be done in practice
##D       # only quaaep4kapmix() would suffice.
##D       if(! as.logical(aep4$ifail)) {
##D          lines(Z, qlmomco(F,aep4), lwd=2, col=2)
##D       }
##D       if(! as.logical(kap$ifail)) {
##D          lines(Z, qlmomco(F,kap),  lwd=2, col=3)
##D       }
##D       message("t3=",t3,"  t4=",t4) # stout for a log file
##D   }
##D }
##D dev.off()
## End(Not run)



