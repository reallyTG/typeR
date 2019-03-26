library(lmomco)


### Name: cdfaep4
### Title: Cumulative Distribution Function of the 4-Parameter Asymmetric
###   Exponential Power Distribution
### Aliases: cdfaep4
### Keywords: distribution cumulative distribution function Distribution:
###   Asymmetric Exponential Power

### ** Examples

x <- -0.1
para <- vec2par(c(0, 100, 0.5, 4), type="aep4")
FF <- cdfaep4(-.1,para)
cat(c("F=",FF,"  and estx=",quaaep4(FF, para),"\n"))
## Not run: 
##D delx <- .1
##D x <- seq(-20,20, by=delx);
##D K <- 1;
##D PAR <- list(para=c(0,1, K, 0.5), type="aep4");
##D plot(x,cdfaep4(x, PAR), type="n",ylim=c(0,1), xlim=range(x),
##D      ylab="NONEXCEEDANCE PROBABILITY");
##D lines(x,cdfaep4(x,PAR), lwd=4);
##D lines(quaaep4(cdfaep4(x,PAR),PAR), cdfaep4(x,PAR), col=2)
##D PAR <- list(para=c(0,1, K, 1), type="aep4");
##D lines(x,cdfaep4(x, PAR), lty=2, lwd=4);
##D lines(quaaep4(cdfaep4(x,PAR),PAR), cdfaep4(x,PAR), col=2)
##D PAR <- list(para=c(0,1, K, 2), type="aep4");
##D lines(x,cdfaep4(x, PAR), lty=3, lwd=4);
##D lines(quaaep4(cdfaep4(x,PAR),PAR), cdfaep4(x,PAR), col=2)
##D PAR <- list(para=c(0,1, K, 4), type="aep4");
##D lines(x,cdfaep4(x, PAR), lty=4, lwd=4);
##D lines(quaaep4(cdfaep4(x,PAR),PAR), cdfaep4(x,PAR), col=2)
## End(Not run)



