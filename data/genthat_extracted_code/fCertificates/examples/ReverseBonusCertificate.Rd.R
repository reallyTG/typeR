library(fCertificates)


### Name: ReverseBonusCertificate
### Title: Reverse Bonus Certificate valuation using pricing by duplication
### Aliases: ReverseBonusCertificate
### Keywords: math

### ** Examples

##
ReverseBonusCertificate(S=110, S0=120, X=100, B=140, Time=1, r=0.045, 
  r_d=0, sigma=0.4, ratio=1)

## payoff diagram
S <- seq(0, 150)
p <- ReverseBonusCertificate(S, S0=120, X=100, B=140, Time=0.1, r=0.045, 
  r_d=0, sigma=0.4, ratio=1)
p2 <- ReverseBonusCertificate(S, S0=120, X=100, B=140, Time=0, r=0.045, 
  r_d=0, sigma=0.4, ratio=1)
plot(S, p,  type="l", col="red", , ylim=range(p, p2, na.rm=TRUE), 
  xlab="underlying price", ylab="payoff", main="Reverse Bonus")
lines(S, p2, col="blue")
abline(v=c(100, 140), lty=2, col="gray80")



