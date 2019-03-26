library(sporm)


### Name: plotor
### Title: Empirical odds rate plot
### Aliases: plotor

### ** Examples

# Use radar tube life data
z<-RadarTube$Days
v<-RadarTube$Type
x<-z[v==1]; y<-z[v==2]
# Dabrowska-Doksum's estimate of theta
theta0.hat<-dd.est(x,y)
vartheta0.hat<-dd.est(y,x)
# MRLE of theta
m<-length(x); n<-length(y)
N<-m+n; lambda<-m/N
phat0<-phi(N, theta0.hat, lambda)/N
theta.hat<-mrle.sporm(x, y, theta0.hat, phat0)$theta
## Empirical Odds Raio Plot
plotor(x, y, main="Empirical Odds Ratio Plot", lwd=2, ylim=c(0,2))
abline(h=theta.hat, lwd=2,lty=2, col=2)
abline(h=1/vartheta0.hat, lwd=2,lty=3, col=3)
abline(h=theta0.hat, lwd=2,lty=4, col=4)



