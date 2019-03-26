library(fCertificates)


### Name: Strangle
### Title: Strangle valuation
### Aliases: Strangle
### Keywords: math

### ** Examples

##
Strangle(S=50, X1=40, X2=60, Time=1, r=0.01, r_d=0, sigma=0.3, ratio=1)

## payoff diagram
S <- 1:100
ps1 <- Strangle(S, X1=45, X2=55, Time=1, r=0.01, r_d=0, sigma=0.3, ratio=1)
ps2 <- Strangle(S, X1=45, X2=55, Time=0, r=0.01, r_d=0, sigma=0.3, ratio=1)
ps3 <- Strangle(S, X1=45, X2=55, Time=1, r=0.01, r_d=0, sigma=0.4, ratio=1)

plot(S, ps2, type="l", col="red", xlab="underlying price", 
  ylab="payoff", main="Strangle")
lines(S, ps1, col="blue")
lines(S, ps3, col="green")
abline(v=c(45, 55), lty=2, col="gray80")



