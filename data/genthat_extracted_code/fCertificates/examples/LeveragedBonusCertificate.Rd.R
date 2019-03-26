library(fCertificates)


### Name: LeveragedBonusCertificate
### Title: Leveraged Bonus Certificate valuation using pricing by
###   duplication
### Aliases: LeveragedBonusCertificate
### Keywords: math

### ** Examples

##
LeveragedBonusCertificate(S=100, X=120, B=80, B2=70, Time=1, r=0.01, r_d=0, 
  sigma=0.3, ratio=1, barrierHit=FALSE)

## payoff diagram
S <- seq(0, 140)
p <- LeveragedBonusCertificate(S, X=120, B=80, B2=70, Time=1, r=0.01, r_d=0, 
  sigma=0.3, ratio=1, barrierHit=FALSE)
p2 <- LeveragedBonusCertificate(S, X=120, B=80, B2=70, Time=0, r=0.01, r_d=0, 
  sigma=0.3, ratio=1, barrierHit=FALSE)
plot(S, p,  type="l", col="red", , ylim=range(p, p2, na.rm=TRUE), 
  xlab="underlying price", ylab="payoff", main="Leveraged Bonus")
lines(S, p2, col="blue")
abline(v=c(70, 80, 120), lty=2, col="gray80")          



