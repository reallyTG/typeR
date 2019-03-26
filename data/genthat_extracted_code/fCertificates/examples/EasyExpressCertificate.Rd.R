library(fCertificates)


### Name: EasyExpressCertificate
### Title: Easy Express Certificate valuation using pricing by duplication
### Aliases: EasyExpressCertificate
### Keywords: math

### ** Examples

##
EasyExpressCertificate(S=80, S0=100, B=70, Time=1, 
  r=0.045, r_d=0, sigma=0.4, ratio = 1)
  
## payoff diagramm
S <- seq(0, 140)
p <- EasyExpressCertificate(S, S0=100, B=70, Time=1, 
  r=0.045, r_d=0, sigma=0.4, ratio = 1)
p2 <- EasyExpressCertificate(S, S0=100, B=70, Time=0, 
  r=0.045, r_d=0, sigma=0.4, ratio = 1)
plot(S, p,  type="l", col="red", , ylim=range(p, p2, na.rm=TRUE), 
  xlab="underlying price", ylab="payoff", main="Easy Express")
lines(S, p2, col="blue")
abline(v=70, lty=2, col="gray80")  



