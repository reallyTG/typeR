library(lmomco)


### Name: quagov
### Title: Quantile Function of the Govindarajulu Distribution
### Aliases: quagov
### Keywords: distribution quantile function Distribution: Govindarajulu

### ** Examples

lmr <- lmoms(c(123,34,4,654,37,78))
quagov(0.5,pargov(lmr))
## Not run: 
##D lmr <- lmoms(c(3, 0.05, 1.6, 1.37, 0.57, 0.36, 2.2));
##D par <- pargov(lmr)# LMRQ said to have a linear mean residual quantile function.
##D # Let us have a look.
##D F <- c(0,nonexceeds(),1)
##D plot(F, qlmomco(F,par), type="l", lwd=3, xlab="NONEXCEEDANCE PROBABILITY",
##D      ylab="LIFE TIME, RESIDUAL LIFE, OR REVERSED RESIDUAL LIFE")
##D lines(F, rmlmomco(F,par),  col=2, lwd=4)  # heavy red line (residual life)
##D lines(F, rrmlmomco(F,par), col=2, lty=2)  # dashed red (reversed res. life)
##D lines(F, cmlmomco(F,par),  col=4)         # conditional mean (blue)
##D # Notice how the conditional mean attaches to the parent at F=1, but it does not
##D # attached at F=0 because of the none zero origin.
##D cmlmomco(0,par)           # 1.307143 # expected life given birth only
##D lmomgov(par)$lambdas[1]   # 1.307143 # expected life of the parent distribution
##D rmlmomco(0, par)          # 1.288989 # residual life given birth only
##D qlmomco(0, par)           # 0.018153 # instantaneous life given birth
##D # Note: qlmomco(0,par) + rmlmomco(0,par) is the E[lifetime], but rmlmomco()
##D # is the RESIDUAL MEAN LIFE.
## End(Not run)



