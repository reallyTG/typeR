library(fCertificates)


### Name: OutperformancePlusCertificate
### Title: Outperformance Plus Certificate valuation using pricing by
###   duplication
### Aliases: OutperformancePlusCertificate
### Keywords: math

### ** Examples

##
OutperformancePlusCertificate(S=10, X=12, B=7, Time=1, 
  r=0.045, r_d=0, sigma=0.4, participation=1.2, ratio = 1)
 
## payoff diagram
S <- seq(30, 100, by=0.1)
p <- OutperformancePlusCertificate(S, X=60, B=40, Time=1, 
  r=0.045, r_d=0, sigma=0.4, participation=1.2, ratio = 1)
p2 <- OutperformancePlusCertificate(S, X=60, B=40, Time=0, 
  r=0.045, r_d=0, sigma=0.4, participation=1.2, ratio = 1)
plot(S, p,  type="l", col="red", , ylim=range(p, p2, na.rm=TRUE), 
  xlab="underlying price", ylab="payoff", main="Outperformance Bonus")
lines(S, p2, col="blue")
abline(v=c(40, 60), lty=2, col="gray80")    



