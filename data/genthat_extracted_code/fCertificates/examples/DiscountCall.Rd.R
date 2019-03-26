library(fCertificates)


### Name: CappedWarrant
### Title: Capped Warrant (Discount Call/Discount Put) valuation using
###   pricing by duplication
### Aliases: DiscountCall DiscountPut
### Keywords: math

### ** Examples

##
DiscountCall(S=10, X=10, Cap=12, Time=1, r=0.045, r_d=0, sigma=0.2, ratio = 1)

## payoff diagram
S <- seq(0,20, by=0.1)
p <- DiscountCall(S, X=10, Cap=12, Time=1, r=0.045, r_d=0, sigma=0.2, ratio = 1)
p2 <- DiscountCall(S, X=10, Cap=12, Time=0, r=0.045, r_d=0, sigma=0.2, ratio = 1)
plot(S, p,  type="l", col="red", , ylim=range(p, p2, na.rm=TRUE), 
  xlab="underlying price", ylab="payoff", main="Discount Call")
lines(S, p2, col="blue")
abline(v=c(10, 12), lty=2, col="gray80") 



