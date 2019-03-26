library(fCertificates)


### Name: BonusCertificate
### Title: Bonus Certificate valuation using pricing by duplication
### Aliases: BonusCertificate
### Keywords: math

### ** Examples

##
BonusCertificate(S=50, X=60 , B=35, Time=2, sigma=0.14, r=0.02, r_d=0, ratio=1)
 
## payoff diagram
S <- seq(0,120)
p <- BonusCertificate(S, X=60 , B=35, Time=2, sigma=0.14, r=0.02, r_d=0, ratio=1)
p2 <- BonusCertificate(S, X=60 , B=35, Time=0, sigma=0.14, r=0.02, r_d=0, ratio=1)
plot(S, p,  type="l", col="red", xlab="underlying price", 
  ylab="payoff", main="Bonus")
lines(S, p2, col="blue")
abline(v=c(35, 60), lty=2, col="gray80")



