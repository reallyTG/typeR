library(tseriesEntropy)


### Name: surrogate.ARs
### Title: Surrogate Time Series Through A Modeling (Smoothed Sieve
###   Bootstrap)
### Aliases: surrogate.ARs
### Keywords: ts

### ** Examples

set.seed(1345)
# Generates a AR(1) series
x      <- arima.sim(n=120, model = list(ar=0.8));
x.surr <- surrogate.ARs(x, order.max=10, nsurr=3);
plot.ts(x.surr$surr,col=4);


## Check that the surrogates have the same ACF of x
corig <- acf(x,10,plot=FALSE)$acf[,,1];
csurr <- acf(x.surr$surr[,1],10,plot=FALSE)$acf[,,1];
round(cbind(corig,csurr,"abs(difference)"=abs(corig-csurr)),3)



