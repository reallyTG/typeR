library(JADE)


### Name: bss.components
### Title: Function to Extract Estimated Sources from an Object of Class
###   bss
### Aliases: bss.components
### Keywords: multivariate

### ** Examples

A<- matrix(rnorm(9),3,3)
s1 <- arima.sim(list(ar=c(0.3,0.6)),1000)
s2 <- arima.sim(list(ma=c(-0.3,0.3)),1000)
s3 <- arima.sim(list(ar=c(-0.8,0.1)),1000)

S <- cbind(s1,s2,s3)
X <- S %*% t(A)

res1<-AMUSE(X)
head(bss.components(res1))
colMeans(bss.components(res1))
cov(bss.components(res1))



