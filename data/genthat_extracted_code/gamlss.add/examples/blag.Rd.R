library(gamlss.add)


### Name: blag
### Title: Functions to create lag values
### Aliases: blag llag wlag
### Keywords: regression ts

### ** Examples

library(stats)
y <- arima.sim(500, model=list(ar=c(.4,.3,.1))) 
X <- blag(y, lags=5, from.lag=1,  value=0)
head(X)
w<-wlag(X)
library(gamlss)
m1<-gamlss(y~X, weights=w )
summary(m1)
plot(y)
lines(fitted(m1)~as.numeric(time(y)), col="blue")



