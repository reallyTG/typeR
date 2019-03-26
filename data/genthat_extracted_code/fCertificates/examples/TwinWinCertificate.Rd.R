library(fCertificates)


### Name: TwinWinCertificate
### Title: Twin Win Certificate valuation using pricing by duplication
### Aliases: TwinWinCertificate
### Keywords: math

### ** Examples

##
TwinWinCertificate(S=100, X=100, B=80, Time=2, r = 0.03, r_d = 0, 
  sigma=0.15, participation=1.2, ratio = 1)
 
## payoff diagram
S <- seq(50, 150, by=0.1)
p <- TwinWinCertificate(S, X=100, B=80, Time=0.2, r = 0.03, r_d = 0, 
  sigma=0.15, participation=1.2, ratio = 1)
p2 <- TwinWinCertificate(S, X=100, B=80, Time=0, r = 0.03, r_d = 0, 
  sigma=0.15, participation=1.2, ratio = 1)
plot(S, p,  type="l", col="red", , ylim=range(p, p2, na.rm=TRUE), 
  xlab="underlying price", ylab="payoff", main="Twin-Win")
lines(S, p2, col="blue")    
abline(v=c(80, 100), lty=2, col="gray80")  



