library(fCertificates)


### Name: ReverseConvertiblePlusPro
### Title: Reverse Convertible Plus Pro Certificate valuation using pricing
###   by duplication
### Aliases: ReverseConvertiblePlusPro
### Keywords: math

### ** Examples

##
ReverseConvertiblePlusPro(S=40, Cap=50, B=35, Time=1, r=0.045, r_d=0, 
  sigma=0.4, nominal=1000, coupon=0.14)
  
## payoff diagram
S <- seq(0, 100)
p <- ReverseConvertiblePlusPro(S, Cap=50, B=35, Time=1, r=0.045, r_d=0, 
  sigma=0.4, nominal=1000, coupon=0.14)
p2 <- ReverseConvertiblePlusPro(S, Cap=50, B=35, Time=0, r=0.045, r_d=0, 
  sigma=0.4, nominal=1000, coupon=0.14)
plot(S, p,  type="l", col="red", xlab="underlying price", 
  ylab="payoff", main="Barrier Reverse Convertible")
lines(S, p2, col="blue")
abline(v=c(35, 50), lty=2, col="gray80")      



