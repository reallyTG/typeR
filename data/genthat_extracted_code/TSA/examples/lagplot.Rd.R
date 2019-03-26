library(TSA)


### Name: lagplot
### Title: Lagged Regression Plot
### Aliases: lagplot
### Keywords: methods

### ** Examples

set.seed(2534567)
par(mfrow=c(3,2))
y=arima.sim(n=61,model=list(ar=c(1.6,-0.94),ma=-0.64))
# lagplot(y)



