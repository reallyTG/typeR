library(lmomco)


### Name: paremu
### Title: Estimate the Parameters of the Eta-Mu Distribution
### Aliases: paremu
### Keywords: distribution (parameters) Distribution: Eta-Mu

### ** Examples

## Not run: 
##D    par1 <- vec2par(c(.3, 2.15), type="emu")
##D    lmr1 <- lmomemu(par1, nmom=4)
##D    par2.1 <- paremu(lmr1, alsofitT3=FALSE, verbose=TRUE, trackoptim=TRUE)
##D    par2.1$para # correct parameters not found: eta=0.889 mu=3.54
##D    par2.2 <- paremu(lmr1, alsofitT3=TRUE, verbose=TRUE, trackoptim=TRUE)
##D    par2.2$para # correct parameters not found: eta=0.9063 mu=3.607
##D    par2.3 <- paremu(lmr1, alsofitT3T4=TRUE,  verbose=TRUE, trackoptim=TRUE)
##D    par2.3$para # correct parameters not found: eta=0.910 mu=3.62
##D    par2.4 <- paremu(lmr1, justfitT3T4=TRUE,  verbose=TRUE, trackoptim=TRUE)
##D    par2.4$para # correct parameters not found: eta=0.559 mu=3.69
##D 
##D    x <- seq(0,3,by=.01)
##D    plot(x,  pdfemu(x, par1), type="l", lwd=6, col=8, ylim=c(0,2))
##D    lines(x, pdfemu(x, par2.1), col=2, lwd=2, lty=2)
##D    lines(x, pdfemu(x, par2.2), col=4)
##D    lines(x, pdfemu(x, par2.3), col=3, lty=3, lwd=2)
##D    lines(x, pdfemu(x, par2.4), col=5, lty=2, lwd=2)
## End(Not run)



