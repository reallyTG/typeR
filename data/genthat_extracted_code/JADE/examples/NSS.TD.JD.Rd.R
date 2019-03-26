library(JADE)


### Name: NSS.TD.JD
### Title: NSS.TD.JD Method for Nonstationary Blind Source Separation
### Aliases: NSS.TD.JD NSS.TD.JD.default NSS.TD.JD.ts
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

NSS3 <- NSS.TD.JD(X)
NSS3
MD(coef(NSS3),A)
plot(NSS3)
cor(NSS3$S,S)

NSS3b <- NSS.TD.JD(X, Tau=c(0,3,7,12), K=6)
MD(coef(NSS3b),A)

NSS3c <- NSS.TD.JD(X, n.cuts=c(1,300,500,600,1000))
MD(coef(NSS3c),A)



