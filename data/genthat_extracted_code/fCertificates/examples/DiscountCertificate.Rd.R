library(fCertificates)


### Name: DiscountCertificate
### Title: Discount Certificate valuation using pricing by duplication
###   using pricing by duplication
### Aliases: DiscountCertificate CoveredCall
### Keywords: math

### ** Examples

##
DiscountCertificate(S=40, X=42, Time=1, r=0.035, r_d=0, sigma=0.3, ratio=1)

## payoff diagram
S <- seq(0, 100)
p <- DiscountCertificate(S, X=42, Time=1, r=0.035, r_d=0, sigma=0.3, ratio=1)
p2 <- DiscountCertificate(S, X=42, Time=0, r=0.035, r_d=0, sigma=0.3, ratio=1)
plot(S, p,  type="l", col="red", , ylim=range(p, p2, na.rm=TRUE), 
  xlab="underlying price", ylab="payoff", main="Discount")
lines(S, p2, col="blue")
abline(v=42, lty=2, col="gray80")



