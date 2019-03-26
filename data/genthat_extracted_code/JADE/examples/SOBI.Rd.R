library(JADE)


### Name: SOBI
### Title: SOBI Method for Blind Source Separation
### Aliases: SOBI SOBI.default SOBI.ts
### Keywords: multivariate ts

### ** Examples

# creating some toy data
A<- matrix(rnorm(9),3,3)
s1 <- arima.sim(list(ar=c(0.3,0.6)),1000)
s2 <- arima.sim(list(ma=c(-0.3,0.3)),1000)
s3 <- arima.sim(list(ar=c(-0.8,0.1)),1000)

S <- cbind(s1,s2,s3)
X <- S %*% t(A)

res1<-SOBI(X)
res1
coef(res1)
plot(res1) # compare to plot.ts(S)
MD(coef(res1),A)

# input of a time series
X2<- ts(X, start=c(1961, 1), frequency=12)
plot(X2)
res2<-SOBI(X2, k=c(5,10,1,4,2,9,10))
plot(res2)



