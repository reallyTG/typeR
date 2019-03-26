library(lmomco)


### Name: genci.simple
### Title: Generate (Estimate) Confidence Intervals for Quantiles of a
###   Parent Distribution
### Aliases: genci genci.simple
### Keywords: distribution (utility)

### ** Examples

## Not run: 
##D # For all these examples, nsim is way too small.
##D mean   <- 0; sigma <- 100
##D parent <- vec2par(c(mean,sigma), type='nor') # make parameter object
##D f      <- c(0.5, 0.8, 0.9, 0.96, 0.98, 0.99) # nonexceed probabilities
##D # nsim is small for speed of example not accuracy.
##D CI     <- genci.simple(parent, n=10, f=f, nsim=20); FF <- CI$nonexceed
##D plot( FF, CI$true, type='l', lwd=2)
##D lines(FF, CI$lwr, col=2); lines(FF, CI$upr, col=3)
##D 
##D pdf("twoCIplots.pdf")
##D # The qnorm() call has been added to produce "normal probability"
##D # paper on the horizonal axis. The parent is heavy-tailed.
##D GEV  <- vec2par(c(10000,1500,-0.3), type='gev') # a GEV distribution
##D CI   <- genci.simple(GEV, n=20, nsim=200, edist='gno')
##D ymin <- log10(min(CI$lwr[! is.na(CI$lwr)]))
##D ymax <- log10(max(CI$upr[! is.na(CI$upr)]))
##D qFF  <- qnorm(CI$nonexceed) 
##D plot( qFF, log10(CI$true), type='l', ylim=c(ymin,ymax),lwd=2)
##D lines(qFF, log10(CI$lwr), col=2); lines(qFF, log10(CI$upr), col=3)
##D # another error distribution model
##D CI   <- genci.simple(GEV, n=20, nsim=200, edist='aep4')
##D lines(qFF,log10(CI$lwr),col=2,lty=2); lines(qFF,log10(CI$upr),col=3,lty=2)
##D dev.off() # 
## End(Not run)



