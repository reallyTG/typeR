library(fCertificates)


### Name: GarantieCertificate
### Title: Guarantee Certificate valuation using pricing by duplication
### Aliases: GarantieCertificate GuaranteeCertificate
### Keywords: math

### ** Examples

##
GarantieCertificate(S=110, X=90, Time=1, r=0.045, r_d=0, 
  sigma=0.4, participation=0.8, ratio = 1, nominal=110)

## payoff diagram
S <- seq(0, 150)
p <- GarantieCertificate(S, X=90, Time=1, r=0.045, r_d=0, 
  sigma=0.4, participation=0.8, ratio = 1, nominal=110)
p2 <- GarantieCertificate(S, X=90, Time=0, r=0.045, r_d=0, 
  sigma=0.4, participation=0.8, ratio = 1, nominal=110)
plot(S, p,  type="l", col="red", , ylim=range(p, p2, na.rm=TRUE), 
  xlab="underlying price", ylab="payoff", 
  main="Uncapped Capital Protection")
lines(S, p2, col="blue")
abline(v=90, lty=2, col="gray80")    



