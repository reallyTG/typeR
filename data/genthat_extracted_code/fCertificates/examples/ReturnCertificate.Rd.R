library(fCertificates)


### Name: ReturnCertificate
### Title: Return Certificate valuation using pricing by duplication
### Aliases: ReturnCertificate
### Keywords: math

### ** Examples

##
ReturnCertificate (S=100, S0=91.7, Bonus=11, B=45, Cap=91.7, 
  Time=0, r=0.02, r_d = 0, sigma=0.3, ratio = 1)

## payoff diagram
S <- seq(30,120, by=1)
p <- ReturnCertificate (S, S0=91.7, Bonus=11, B=45, Cap=91.7, 
  Time=0.5, r=0.02, r_d = 0, sigma=0.3, ratio = 1)
p2 <- ReturnCertificate (S, S0=91.7, Bonus=11, B=45, Cap=91.7, 
  Time=0, r=0.02, r_d = 0, sigma=0.3, ratio = 1)
plot(S, p,  type="l", col="red", , ylim=range(p, p2, na.rm=TRUE), 
  xlab="underlying price", ylab="payoff", main="Return Certificate")
lines(S, p2, col="blue")
abline(v=c(45,91.7), lty=2, col="gray80")



