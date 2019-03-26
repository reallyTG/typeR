library(JADE)


### Name: NSS.JD
### Title: NSS.JD Method for Nonstationary Blind Source Separation
### Aliases: NSS.JD NSS.JD.default NSS.JD.ts
### Keywords: multivariate ts

### ** Examples

n <- 1000
s1 <- rnorm(n)
s2 <- 2*sin(pi/200*1:n)* rnorm(n)
s3 <- c(rnorm(n/2), rnorm(100,0,2), rnorm(n/2-100,0,1.5))
S <- cbind(s1,s2,s3)
plot.ts(S)
A<-matrix(rnorm(9),3,3)
X<- S%*%t(A)

NSS2 <- NSS.JD(X)
NSS2
MD(coef(NSS2),A)
plot(NSS2)
cor(NSS2$S,S)

NSS2b <- NSS.JD(X, Tau=1)
MD(coef(NSS2b),A)

NSS2c <- NSS.JD(X, n.cuts=c(1,300,500,600,1000))
MD(coef(NSS2c),A)



