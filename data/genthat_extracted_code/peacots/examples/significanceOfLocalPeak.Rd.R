library(peacots)


### Name: significanceOfLocalPeak
### Title: Statistical significance of local periodogram peaks
### Aliases: significanceOfLocalPeak
### Keywords: ~kwd1 ~kwd2

### ** Examples

  # In this example we generate a random cyclic time series, where the peak is (most likely)
  # masked by a strong low-frequency maximum.
  # We will use significanceOfLocalPeak() to evaluate its significance
  # based on its deviation from the expected power.
  
  # generate cyclic time series by adding a periodic signal to an OUSS process
  period    = 1;
  times     = seq(0,20,0.2);
  signal    = 0.5 * cos(2*pi*times/period) +
              generate_ouss(times, mu=0, sigma=1, lambda=1, epsilon=0.5);
  
  # calculate periodogram and fit OUSS model
  report    = evaluate.pm(times=times, signal=signal);
  print(report)
	
  # find which periodogram mode approximately corresponds to the frequency we are interested in
  cycleMode = which(report$frequencies>=0.99/period)[1]; 
	
  # calculate P-value for local peak
  Pvalue    = significanceOfLocalPeak(power_o     = report$power_o, 
                                      lambda      = report$lambda, 
                                      power_e     = report$power_e, 
                                      time_step   = report$time_step, 
                                      series_size = length(times),
                                      Nfreq       = length(report$frequencies), 
                                      peakFreq    = report$frequencies[cycleMode], 
                                      peakPower   = report$periodogram[cycleMode]);

  # plot time series
  old.par <- par(mfrow=c(1, 2));
  plot(ts(times), ts(signal), 
       xy.label=FALSE, type="l", 
       ylab="signal", xlab="time", main="Time series (cyclic)", 
       cex=0.8, cex.main=0.9);

  # plot periodogram
  title = sprintf("Periodogram OUSS analysis\nfocusing on local peak at freq=%.3g\nPlocal=%.2g",
                  report$frequencies[cycleMode],Pvalue);
  plot(ts(report$frequencies), ts(report$periodogram), 
       xy.label=FALSE, type="l", 
       ylab="power", xlab="frequency", main=title, 
       col="black", cex=0.8, cex.main=0.9);
	
  # plot fitted OUSS power spectrum
  lines(report$frequencies, report$fittedPS, col="red");
	par(old.par)




