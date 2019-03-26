library(fCertificates)


### Name: DiscountPlusCertificate
### Title: DiscountPlus Certificate valuation using pricing by duplication
### Aliases: DiscountPlusCertificate
### Keywords: math

### ** Examples

##
DiscountPlusCertificate(S=42, X=42, B=30, Time=1, r=0.035, r_d=0, sigma=0.3, ratio=1)

## payoff diagram
S <- seq(0, 100)
p <- DiscountPlusCertificate(S, X=42, B=30, Time=1, r=0.035, r_d=0, sigma=0.3, ratio=1)
p2 <- DiscountPlusCertificate(S, X=42, B=30, Time=0, r=0.035, r_d=0, sigma=0.3, ratio=1)
plot(S, p,  type="l", col="red", , ylim=range(p, p2, na.rm=TRUE), 
  xlab="underlying price", ylab="payoff", main="Barrier Discount")
lines(S, p2, col="blue")
abline(v=c(30, 42), lty=2, col="gray80")



