library(fCertificates)


### Name: CappedBonusCertificate
### Title: Capped Bonus Certificate valuation using pricing by duplication
### Aliases: CappedBonusCertificate
### Keywords: math

### ** Examples

##
CappedBonusCertificate(S=50, X=60 , B=35, Cap=75, Time=2, sigma=0.14, 
  r=0.02, r_d=0, ratio=1)
   
## payoff diagram
S <- seq(0,120)
p <- CappedBonusCertificate(S, X=60 , B=35, Cap=75, Time=2, sigma=0.14, 
  r=0.02, r_d=0, ratio=1)
p2 <- CappedBonusCertificate(S, X=60 , B=35, Cap=75, Time=0, sigma=0.14, 
  r=0.02, r_d=0, ratio=1)
plot(S, p,  type="l", col="red", ylim=range(p, p2, na.rm=TRUE), 
  xlab="underlying price", ylab="payoff", main="Capped Bonus")
lines(S, p2, col="blue")
abline(v=c(35, 60, 75), lty=2, col="gray80") 



