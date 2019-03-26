library(fCertificates)


### Name: TurboCertificate
### Title: Turbo Certificate valuation
### Aliases: TurboCertificate
### Keywords: math

### ** Examples

##
TurboCertificate("c", S=40, X=42, B=38, Time=1, r=0.035, r_d=0, 
  sigma=0.3, ratio=1)

## payoff
S <- seq(0, 100)
p <- TurboCertificate("c", S, X=42, B=38, Time=1, r=0.035, r_d=0, 
  sigma=0.3, ratio=1)
p2 <- TurboCertificate("c", S, X=42, B=38, Time=0, r=0.035, r_d=0, 
  sigma=0.3, ratio=1)
plot(S, p,  type="l", col="red", , ylim=range(p, p2, na.rm=TRUE), 
  xlab="underlying price", ylab="payoff", main="Knock-out Warrant")
lines(S, p2, col="blue")
abline(v=c(38, 42), lty=2, col="gray80")



