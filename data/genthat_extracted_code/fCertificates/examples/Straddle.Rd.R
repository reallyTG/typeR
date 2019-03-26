library(fCertificates)


### Name: Straddle
### Title: Straddle valuation
### Aliases: Straddle
### Keywords: math

### ** Examples

S <- seq(0, 100)
prices <- Straddle(S, X=50, Time=0, r=0.05, r_d=0, sigma=0.2, ratio = 1)
plot(S, prices, type="l", xlab="underlying price", ylab="payoff") 
 
## Straddle payoff diagram
S <- seq(0, 100)
ps1 <- Straddle(S, X=45, Time=1, r=0.01, r_d=0, sigma=0.3, ratio=1)
ps2 <- Straddle(S, X=45, Time=0, r=0.01, r_d=0, sigma=0.3, ratio=1)
ps3 <- Straddle(S, X=45, Time=1, r=0.01, r_d=0, sigma=0.4, ratio=1)

plot(S, ps2, type="l", col="red", xlab="underlying price", 
  ylab="payoff", main="Straddle")
lines(S, ps1, col="blue")
lines(S, ps3, col="green")
abline(v=45, lty=2, col="gray80")



