library(fCertificates)


### Name: ReverseDiscountCertificate
### Title: Reverse Discount Certificate valuation using pricing by
###   duplication
### Aliases: ReverseDiscountCertificate
### Keywords: math

### ** Examples

## 
ReverseDiscountCertificate(S=100, S0=100, X=90, Time=1, 
  r=0.045, r_d=0, sigma=0.4, ratio=1)

## payoff diagram
S <- seq(0, 150)
p <- ReverseDiscountCertificate(S, S0=100, X=90, Time=1, 
  r=0.045, r_d=0, sigma=0.4, ratio=1)
p2 <- ReverseDiscountCertificate(S, S0=100, X=90, Time=0, 
  r=0.045, r_d=0, sigma=0.4, ratio=1)
plot(S, p,  type="l", col="red", ylim=range(p, p2, na.rm=TRUE), 
  xlab="underlying price", ylab="payoff", main="Reverse Discount")
lines(S, p2, col="blue")
abline(v=90, lty=2, col="gray80")



