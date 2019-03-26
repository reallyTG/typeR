library(fCertificates)


### Name: ReverseConvertible
### Title: Reverse Convertible Certificate valuation using pricing by
###   duplication
### Aliases: ReverseConvertible
### Keywords: math

### ** Examples

##
ReverseConvertible(S=40, Cap=50, Time=1, r=0.045, r_d=0, sigma=0.4, 
  nominal=1000, coupon=0.14)

## payoff diagram
S <- seq(0, 100)
p <- ReverseConvertible(S, Cap=50, Time=1, r=0.045, r_d=0, sigma=0.4, 
  nominal=1000, coupon=0.14)
p2 <- ReverseConvertible(S, Cap=50, Time=0, r=0.045, r_d=0, sigma=0.4, 
  nominal=1000, coupon=0.14)
plot(S, p,  type="l", col="red", xlab="underlying price", 
  ylab="payoff", main="Reverse Convertible")
lines(S, p2, col="blue")
abline(v=50, lty=2, col="gray80")



