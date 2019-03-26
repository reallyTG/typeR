library(TSA)


### Name: spec
### Title: Computing the spectrum
### Aliases: spec
### Keywords: methods

### ** Examples

set.seed(271435); n=200; phi=-0.6
y=arima.sim(model=list(ar=phi),n=n)
k=kernel('daniell',m=15)
sp=spec(y,kernel=k,main='',sub='',xlab='Frequency',
ylab='Log(Smoothed Sample Spectrum)',ci.plot=TRUE,ci.col='black')
lines(sp$freq,ARMAspec(model=list(ar=phi),sp$freq,plot=FALSE)$spec,lty=4)
abline(h=0)



