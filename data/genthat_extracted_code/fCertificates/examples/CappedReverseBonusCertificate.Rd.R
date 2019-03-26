library(fCertificates)


### Name: CappedReverseBonusCertificate
### Title: Capped Reverse Bonus Certificate valuation using pricing by
###   duplication
### Aliases: CappedReverseBonusCertificate ReverseCappedBonusCertificate
### Keywords: math

### ** Examples

##
CappedReverseBonusCertificate(S=110, S0=100, X=80, B=120, Cap=70, Time=1, 
  r=0.045, r_d=0, sigma=0.4, ratio = 1)
  
## payoff diagram
S <- seq(0,150)
p <- CappedReverseBonusCertificate(S, S0=100, X=80, B=120, Cap=70, Time=1, 
  r=0.045, r_d=0, sigma=0.4, ratio = 1)
p2 <- CappedReverseBonusCertificate(S, S0=100, X=80, B=120, Cap=70, Time=0, 
  r=0.045, r_d=0, sigma=0.4, ratio = 1)
plot(S, p,  type="l", col="red", ylim=range(p, p2, na.rm=TRUE), 
  xlab="underlying price", ylab="payoff", main="Reverse Capped Bonus")
lines(S, p2, col="blue")
abline(v=c(70, 80, 120), lty=2, col="gray80")    



