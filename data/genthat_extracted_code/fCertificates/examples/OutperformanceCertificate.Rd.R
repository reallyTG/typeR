library(fCertificates)


### Name: OutperformanceCertificate
### Title: Outperformance Certificate valuation using pricing by
###   duplication
### Aliases: OutperformanceCertificate
### Keywords: math

### ** Examples

##
OutperformanceCertificate(S=50, X=60, Time=1, 
  r=0.03, r_d=0, sigma=0.4, participation=1.2, ratio = 1)
    
## payoff diagram
S <- seq(0,100)
p <- OutperformanceCertificate(S, X=60, Time=1, 
  r=0.03, r_d=0, sigma=0.4, participation=1.2, ratio = 1)
p2 <- OutperformanceCertificate(S, X=60, Time=0, 
  r=0.03, r_d=0, sigma=0.4, participation=1.2, ratio = 1)
plot(S, p,  type="l", col="red", , ylim=range(p, p2, na.rm=TRUE), 
  xlab="underlying price", ylab="payoff", main="Outperformance")
lines(S, p2, col="blue")
abline(v=60, lty=2, col="gray80")    



