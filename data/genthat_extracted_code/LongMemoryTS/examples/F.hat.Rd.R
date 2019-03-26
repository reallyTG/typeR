library(LongMemoryTS)


### Name: F.hat
### Title: Empirical cummulative spectral distribution function
### Aliases: F.hat

### ** Examples

T<-500
d<-c(0.4, 0.2, 0.3)

data<-FI.sim(T, q=3, rho=0, d=d)
X<-data[,1:2]
Y<-data[,3]
F.hat(X, Y, 1, floor(T/2))



