library(fCertificates)


### Name: ReverseDiscountPlusCertificate
### Title: Reverse Discount Plus Certificate valuation using pricing by
###   duplication
### Aliases: ReverseDiscountPlusCertificate
### Keywords: math

### ** Examples

##
ReverseDiscountPlusCertificate(S=100, S0=100, X=90, B=110, Time=1, 
  r=0.045, r_d=0, sigma=0.4, ratio = 1, barrierActive = TRUE)
  
## payoff diagram
S <- seq(0, 150)
p <- ReverseDiscountPlusCertificate(S, S0=100, X=90, B=110, Time=1, 
  r=0.045, r_d=0, sigma=0.4, ratio = 1, barrierActive = TRUE)
p2 <- ReverseDiscountPlusCertificate(S, S0=100, X=90, B=110, Time=0, 
  r=0.045, r_d=0, sigma=0.4, ratio = 1, barrierActive = FALSE)
p3 <- ReverseDiscountPlusCertificate(S, S0=100, X=90, B=110, Time=0, 
  r=0.045, r_d=0, sigma=0.4, ratio = 1, barrierActive = TRUE)  
plot(S, p,  type="l", col="red", ylim=range(p, p2, na.rm=TRUE), 
  xlab="underlying price", ylab="payoff", main="Reverse Discount Plus Pro")
lines(S, p2, col="blue", lty=2)
lines(S, p3, col="blue")    
abline(v=c(90, 110), lty=2, col="gray80")  



