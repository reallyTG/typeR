library(JADE)


### Name: coef.bss
### Title: Coefficients of a bss Object
### Aliases: coef.bss
### Keywords: methods

### ** Examples

A<- matrix(rnorm(9),3,3)
s1 <- arima.sim(list(ar=c(0.3,0.6)),1000)
s2 <- arima.sim(list(ma=c(-0.3,0.3)),1000)
s3 <- arima.sim(list(ar=c(-0.8,0.1)),1000)

S <- cbind(s1,s2,s3)
X <- S %*% t(A)

res1<-AMUSE(X)
coef(res1)
coef(res1) %*% A # should be a matrix with one dominant element in each row and column



