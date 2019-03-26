library(lmomco)


### Name: qualmrq
### Title: Quantile Function of the Linear Mean Residual Quantile Function
###   Distribution
### Aliases: qualmrq
### Keywords: distribution quantile function Distribution: Linear Mean
###   Residual Quantile Function

### ** Examples

lmr <- lmoms(c(3, 0.05, 1.6, 1.37, 0.57, 0.36, 2.2));
par <- parlmrq(lmr)
qualmrq(0.75,par)  
## Not run: 
##D # The distribution is said to have a linear mean residual quantile function.
##D # Let us have a look.
##D F <- nonexceeds(); par <- vec2par(c(101,21), type="lmrq")
##D plot(F, qlmomco(F,par), type="l", lwd=3, xlab="NONEXCEEDANCE PROBABILITY",
##D      ylab="LIFE TIME, RESIDUAL LIFE, OR REVERSED RESIDUAL LIFE")
##D lines(F, rmlmomco(F,par),  col=2, lwd=4) # heavy red line (residual life)
##D lines(F, rrmlmomco(F,par), col=2, lty=2) # dashed red (reversed res. life)
##D lines(F, cmlmomco(F,par),  col=4)        # conditional mean (blue)
##D # Notice that the rmlmomco() is a straight line as the name of the parent
##D # distribution: Linear Mean Residual Quantile Distribution suggests.
##D # Curiously, the reversed mean residual is not linear.
## End(Not run)



