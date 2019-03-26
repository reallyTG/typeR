library(lmomco)


### Name: quaaep4
### Title: Quantile Function of the 4-Parameter Asymmetric Exponential
###   Power Distribution
### Aliases: quaaep4
### Keywords: distribution quantile function Distribution: Asymmetric
###   Exponential Power

### ** Examples

para <- vec2par(c(0,1, 0.5, 2), type="aep4");
IQR <- quaaep4(0.75,para) - quaaep4(0.25,para);
cat("Interquartile Range=",IQR,"\n")

## Not run: 
##D F <- c(0.00001, 0.0001, 0.001, seq(0.01, 0.99, by=0.01),
##D        0.999, 0.9999, 0.99999);
##D delx <- 0.1;
##D x <- seq(-10,10, by=delx);
##D K <- .67
##D 
##D PAR <- list(para=c(0,1, K, 0.5), type="aep4");
##D plot(x,cdfaep4(x, PAR), type="n",
##D      ylab="NONEXCEEDANCE PROBABILITY",
##D      ylim=c(0,1), xlim=c(-20,20));
##D lines(x,cdfaep4(x,PAR), lwd=3);
##D lines(quaaep4(F, PAR), F, col=4);
##D 
##D PAR <- list(para=c(0,1, K, 1), type="aep4");
##D lines(x,cdfaep4(x, PAR), lty=2, lwd=3);
##D lines(quaaep4(F, PAR), F, col=4, lty=2);
##D 
##D PAR <- list(para=c(0,1, K, 2), type="aep4");
##D lines(x,cdfaep4(x, PAR), lty=3, lwd=3);
##D lines(quaaep4(F, PAR), F, col=4, lty=3);
##D 
##D PAR <- list(para=c(0,1, K, 4), type="aep4");
##D lines(x,cdfaep4(x, PAR), lty=4, lwd=3);
##D lines(quaaep4(F, PAR), F, col=4, lty=4);
## End(Not run)



