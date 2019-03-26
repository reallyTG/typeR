library(lmomco)


### Name: pdflmrq
### Title: Probability Density Function of the Linear Mean Residual
###   Quantile Function Distribution
### Aliases: pdflmrq
### Keywords: distribution probability density function Distribution:
###   Linear Mean Residual Quantile Function

### ** Examples

lmr <- lmoms(c(3, 0.05, 1.6, 1.37, 0.57, 0.36, 2.2))
pdflmrq(3,parlmrq(lmr))
## Not run: 
##D para.lmrq <- list(para=c(2.1043, 0.4679), type="lmrq")
##D para.wei  <- vec2par(c(0,2,0.9), type="wei") # note switch from Midhu et al. ordering.
##D F <- seq(0.01,0.99,by=.01); x <- qualmrq(F, para.lmrq)
##D plot(x, pdflmrq(x, para.lmrq), type="l", ylab="", lwd=2, lty=2, col=2,
##D      xlab="The p.d.f. of Weibull and p.d.f. of LMRQD", xaxs="i", yaxs="i",
##D      xlim=c(0,9), ylim=c(0,0.8))
##D lines(x, pdfwei(x, para.wei))
##D mtext("Midhu et al. (2013, Statis. Meth.)")
## End(Not run)



