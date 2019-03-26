library(lmomco)


### Name: pdfaep4
### Title: Probability Density Function of the 4-Parameter Asymmetric
###   Exponential Power Distribution
### Aliases: pdfaep4
### Keywords: distribution probability density function Distribution:
###   Asymmetric Exponential Power

### ** Examples

aep4 <- vec2par(c(1000,15000,0.5,0.4), type='aep4');
F <- nonexceeds();
x <- quaaep4(F,aep4);
check.pdf(pdfaep4,aep4,plot=TRUE);
## Not run: 
##D delx <- .01;
##D x <- seq(-10,10, by=delx);
##D K <- 3;
##D PAR <- list(para=c(0,1, K, 0.5), type="aep4");
##D plot(x,pdfaep4(x, PAR), type="n",
##D      ylab="PROBABILITY DENSITY",
##D      ylim=c(0,0.6), xlim=range(x));
##D lines(x,pdfaep4(x,PAR), lwd=2);
##D 
##D PAR <- list(para=c(0,1, K, 1), type="aep4");
##D lines(x,pdfaep4(x, PAR), lty=2, lwd=2);
##D 
##D PAR <- list(para=c(0,1, K, 2), type="aep4");
##D lines(x,pdfaep4(x, PAR), lty=3, lwd=2);
##D 
##D PAR <- list(para=c(0,1, K, 4), type="aep4");
##D lines(x,pdfaep4(x, PAR), lty=4, lwd=2);
## End(Not run)



