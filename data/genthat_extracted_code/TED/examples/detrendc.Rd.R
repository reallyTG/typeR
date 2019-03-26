library(TED)


### Name: detrendc
### Title: Conditionally detrend a time series
### Aliases: detrendc

### ** Examples

t=seq(0.001,1,0.001)
set.seed(123)
x=10*t+rnorm(1000)
dtrx=detrendc(x)
# plot the simulated x
plot(t,x,ty='l',xlab='t',ylab='x')
# plot the detrended x
lines(t,dtrx,col=2)
legend(0,12,legend=c('x','detrended x'),col=c(1,2),lty=1)



