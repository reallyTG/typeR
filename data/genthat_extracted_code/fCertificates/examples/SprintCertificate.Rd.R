library(fCertificates)


### Name: SprintCertificate
### Title: Sprint Certificate valuation using pricing by duplication
### Aliases: SprintCertificate
### Keywords: math

### ** Examples

##
SprintCertificate(S=32, X=30, Cap=40, Time=1, r=0.045, 
  r_d=0, sigma=0.4, participation=2, ratio = 1)

## payoff diagramm
S <- seq(0, 100)
p <- SprintCertificate(S, X=30, Cap=40, Time=1, r=0.045, 
  r_d=0, sigma=0.4, participation=2, ratio = 1)  
p2 <- SprintCertificate(S, X=30, Cap=40, Time=0, r=0.045, 
  r_d=0, sigma=0.4, participation=2, ratio = 1)  
plot(S, p,  type="l", col="red", , ylim=range(p, p2, na.rm=TRUE), 
  xlab="underlying price", ylab="payoff", main="Sprint")
lines(S, p2, col="blue")
abline(v=c(30, 40), lty=2, col="gray80")



