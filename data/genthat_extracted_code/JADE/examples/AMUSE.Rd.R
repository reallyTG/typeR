library(JADE)


### Name: AMUSE
### Title: AMUSE Method for Blind Source Separation
### Aliases: AMUSE AMUSE.default AMUSE.ts
### Keywords: multivariate ts

### ** Examples

# creating some toy data
A<- matrix(rnorm(9),3,3)
s1 <- arima.sim(list(ar=c(0.3,0.6)),1000)
s2 <- arima.sim(list(ma=c(-0.3,0.3)),1000)
s3 <- arima.sim(list(ar=c(-0.8,0.1)),1000)

S <- cbind(s1,s2,s3)
X <- S %*% t(A)

res1<-AMUSE(X)
res1
coef(res1)
plot(res1) # compare to plot.ts(S)
MD(coef(res1),A)

# input of a time series
X2<- ts(X, start=c(1961, 1), frequency=12)
plot(X2)
res2<-AMUSE(X2, k=2)
plot(res2)



