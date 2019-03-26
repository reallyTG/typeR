library(fCertificates)


### Name: AirbagCertificate
### Title: Airbag Certificate valuation using pricing by duplication
### Aliases: AirbagCertificate
### Keywords: math

### ** Examples

##
AirbagCertificate(S=100, X=100, B=75, Time=0, r=0.045, r_d=0, sigma=0.2, 
  participation=1, ratio=1)

## payoff diagram
S <- seq(0,120)
p <- AirbagCertificate(S, X=100, B=75, Time=1, r=0.045, r_d=0, sigma=0.2, 
  participation=1, ratio=1)
p2 <- AirbagCertificate(S, X=100, B=75, Time=0, r=0.045, r_d=0, sigma=0.2, 
  participation=1, ratio=1)
plot(S, p,  type="l", col="red", xlab="underlying price", 
  ylab="payoff", main="Airbag")
lines(S, p2, col="blue")
abline(v=c(75, 100), lty=2, col="gray80")



