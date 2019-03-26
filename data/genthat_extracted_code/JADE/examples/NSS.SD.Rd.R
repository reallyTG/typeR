library(JADE)


### Name: NSS.SD
### Title: NSS.SD Method for Nonstationary Blind Source Separation
### Aliases: NSS.SD NSS.SD.default NSS.SD.ts
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

NSS1 <- NSS.SD(X)
NSS1
MD(coef(NSS1),A)
plot(NSS1)
cor(NSS1$S,S)

NSS1b <- NSS.SD(X, n.cut=400)
MD(coef(NSS1b),A)

NSS1c <- NSS.SD(X, n.cut=c(1,600,1000))
MD(coef(NSS1c),A)



