library(gamlssbssn)


### Name: BSSN
### Title: Bimodal Skew Symmetric Normal Distribution
### Aliases: BSSN dBSSN pBSSN qBSSN rBSSN

### ** Examples

op<-par(mfrow=c(3,3))
curve(dBSSN(x,  mu=1, sigma=0.1, nu=1, tau=1),-12, 12, ylab="f(x)", main="BSSN")
curve(dBSSN(x,  mu=1, sigma=0.1, nu=1, tau=5),-12, 12,ylab="f(x)", main="BSSN")
curve(dBSSN(x,  mu=1, sigma=0.1, nu=1, tau=10),-12, 12, ylab="f(x)", main="BSSN")
curve(dBSSN(x,  mu=1, sigma=0.1, nu=1, tau=20),-12, 12, ylab="f(x)", main="BSSN")
curve(dBSSN(x,  mu=1, sigma=0.1, nu=0, tau=4),-12, 12, ylab="f(x)", main="BSSN")
curve(dBSSN(x,  mu=-1, sigma=0.1, nu=0, tau=3),-12, 12, ylab="f(x)", main="BSSN")
curve(dBSSN(x,  mu=1, sigma=0.1, nu=2, tau=0),-12, 12, ylab="f(x)", main="BSSN")
curve(dBSSN(x,  mu=-1, sigma=0.1, nu=-2, tau=0),-12, 12, ylab="f(x)", main="BSSN")
curve(dBSSN(x,  mu=-1, sigma=0.1, nu=-3, tau=0.8),-12, 12, ylab="f(x)", main="BSSN")
par(op)



