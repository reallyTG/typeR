library(lmomco)


### Name: parkmu
### Title: Estimate the Parameters of the Kappa-Mu Distribution
### Aliases: parkmu
### Keywords: distribution (parameters) Distribution: Kappa-Mu

### ** Examples

## Not run: 
##D    par1 <- vec2par(c(0.7, 0.2), type="kmu")
##D    lmr1 <- lmomkmu(par1, nmom=4)
##D    par2.1 <- parkmu(lmr1, alsofitT3=TRUE,   verbose=TRUE, trackoptim=TRUE)
##D    par2.1$para
##D    par2.2 <- parkmu(lmr1, alsofitT3T4=TRUE, verbose=TRUE, trackoptim=TRUE)
##D    par2.2$para
##D    par2.3 <- parkmu(lmr1, alsofitT3=FALSE,  verbose=TRUE, trackoptim=TRUE)
##D    par2.3$para
##D    par2.4 <- parkmu(lmr1, justfitT3T4=TRUE, verbose=TRUE, trackoptim=TRUE)
##D    par2.4$para
##D    x <- seq(0,3,by=.01)
##D    plot(x,  pdfkmu(x, par1), type="l", lwd=6, col=8, ylim=c(0,5))
##D    lines(x, pdfkmu(x, par2.1), col=2, lwd=2, lty=2)
##D    lines(x, pdfkmu(x, par2.2), col=4)
##D    lines(x, pdfkmu(x, par2.3), col=3, lty=3, lwd=2)
##D    lines(x, pdfkmu(x, par2.4), col=5, lty=2, lwd=2)
## End(Not run)
## Not run: 
##D    par1 <- vec2par(c(1, 0.65), type="kmu")
##D    lmr1 <- lmomkmu(par1, nmom=4)
##D    par2.1 <- parkmu(lmr1, alsofitT3=TRUE,   verbose=TRUE, trackoptim=TRUE)
##D    par2.1$para # eta=1.0  mu=0.65
##D    par2.2 <- parkmu(lmr1, alsofitT3T4=TRUE, verbose=TRUE, trackoptim=TRUE)
##D    par2.2$para # eta=1.0  mu=0.65
##D    par2.3 <- parkmu(lmr1, alsofitT3=FALSE,  verbose=TRUE, trackoptim=TRUE)
##D    par2.3$para # eta=8.5779  mu=0.2060
##D    par2.4 <- parkmu(lmr1, justfitT3T4=TRUE, verbose=TRUE, trackoptim=TRUE)
##D    par2.4$para # eta=1.0 mu=0.65
##D    x <- seq(0,3,by=.01)
##D    plot(x,  pdfkmu(x, par1), type="l", lwd=6, col=8, ylim=c(0,1))
##D    lines(x, pdfkmu(x, par2.1), col=2, lwd=2, lty=2)
##D    lines(x, pdfkmu(x, par2.2), col=4)
##D    lines(x, pdfkmu(x, par2.3), col=3, lty=3, lwd=2)
##D    lines(x, pdfkmu(x, par2.4), col=5, lty=2, lwd=2)
##D    lines(x, dlmomco(x, lmom2par(lmr1, type="gam")),  lwd=2, col=2)
##D    lines(x, dlmomco(x, lmom2par(lmr1, type="ray")),  lwd=2, col=2, lty=2)
##D    lines(x, dlmomco(x, lmom2par(lmr1, type="rice")), lwd=2, col=4, lty=2)
## End(Not run)



