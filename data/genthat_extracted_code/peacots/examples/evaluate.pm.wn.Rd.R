library(peacots)


### Name: evaluate.pm.wn
### Title: Statistical significance of periodogram peaks (classical)
### Aliases: evaluate.pm.wn
### Keywords: statistics

### ** Examples

# generate time series
times  = seq(0,20,0.25);
signal = rnorm(n=length(times));
report = evaluate.pm.wn(times=times, signal=signal);

# plot time series
old.par <- par(mfrow=c(1, 2));
plot(ts(times), ts(signal), 
     xy.label=FALSE, type="l", 
     ylab="signal", xlab="time", main="OUSS time series");
     
# plot periodogram
title = sprintf("Periodogram OUSS analysis\n(peak freq=%.3g, P=%.2g)",
                report$frequencies[report$peakMode],report$P);
plot(ts(report$frequencies),
     ts(report$periodogram), 
     xy.label=FALSE, type="l", 
     ylab="power", xlab="frequency", 
     main=title, col="black");
	
# plot fitted flat WN power
lines(c(report$frequencies[1],tail(report$frequencies,1)), 
      c(report$powerEstimate, report$powerEstimate ), col="blue");
par(old.par)




