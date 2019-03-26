library(fCertificates)


### Name: BonusProCertificate
### Title: Bonus Pro Certificate valuation using pricing by duplication
### Aliases: BonusProCertificate
### Keywords: math

### ** Examples

## payoff diagram
S <- seq(50, 130, by=2)
p1 <- numeric(length(S))
p2 <- numeric(length(S))
for (i in seq(along=S))
{
  p1[i] <- BonusProCertificate(TypeFlag="pdoB2", S=S[i], X=100, B=70, 
     Time=0.5, time1 = 0.25, 
     r=0.01, r_d=0, sigma=0.3, ratio = 1)
  p2[i] <- BonusProCertificate(TypeFlag="pdoB2", S=S[i], X=100, B=70, 
     Time=0, time1 = 0, 
     r=0.01, r_d=0, sigma=0.3, ratio = 1)
}   
plot(S, p1, ylim=range(p1, p2, na.rm=TRUE), type="l", lwd=2, col="red",
  xlab="underlying price", ylab="payoff", main="Bonus Pro Certificate")
lines(S, p2, lwd=2, col="blue")
abline(v=c(70, 100), lty=2, col="gray80")
    
## example: BonusPro vs. Bonus Certificate
S <- seq(50, 130, by=2)
p1 <- numeric(length(S))
p2 <- numeric(length(S))
for (i in seq(along=S))
{
  p1[i] <- BonusProCertificate(TypeFlag="pdoB2", S=S[i], X=100, B=70, 
    Time=1, time1 = 0.75, 
    r=0.01, r_d=0, sigma=0.3, ratio = 1)
  p2[i] <- BonusProCertificate(TypeFlag="pdoB2", S=S[i], X=100, B=70, 
    Time=1, time1 = 0.25, 
    r=0.01, r_d=0, sigma=0.3, ratio = 1)
}
p3 <- BonusCertificate(S=S, X=100, B=70, Time=1, r=0.01, r_d=0, sigma=0.3, ratio = 1)
  
plot(S, S, ylim=range(S, p1, p2, p3), type="l", lwd=2, 
  xlab="underlying price", ylab="payoff", main="Bonus Pro Certificate vs. Bonus Certificate")
lines(S, p1, lwd=2, col="red")
lines(S, p2, lwd=2, col="blue")
lines(S, p3, lwd=2, col="darkgreen")
abline(v=c(70,100), lty=2, col="gray")



