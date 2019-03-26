library(peacots)


### Name: generate_ouss
### Title: Generate random time series of the OUSS process
### Aliases: generate_ouss
### Keywords: Statistics Mathematics

### ** Examples

# define times
times = seq(0,100,0.5);

# generate OUSS time series
signal 	= generate_ouss(times=times, mu=0, sigma=1, lambda=1, epsilon=0.5);

# plot time series
plot(ts(times), ts(signal), 
     xy.label=FALSE, type="l", 
     ylab="signal", xlab="time", main="OUSS time series");



