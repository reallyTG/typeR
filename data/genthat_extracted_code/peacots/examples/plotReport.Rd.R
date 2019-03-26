library(peacots)


### Name: plotReport
### Title: Plot results of a 'evaluate.pm' analysis
### Aliases: plotReport
### Keywords: statistics

### ** Examples

# generate cyclic time series by adding a periodic signal to an OUSS process
times  = seq(0,20,0.25);
signal = 0.6 * cos(2*pi*times) + generate_ouss(times, mu=0, sigma=1, lambda=1, epsilon=0.5);

# find periodogram peak and estimate statistical significance
report = evaluate.pm( times=times, 
                      signal=signal, 
                      minPeakFreq=0.3, 
                      minFitFreq=0.3,
                      startRadius=2);

# plot overview of periodogram peak analysis
plotReport(sprintf("Example"), times=times, signal=signal, report=report);



