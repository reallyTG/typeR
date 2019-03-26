library(peacots)


### Name: peacots-package
### Title: Periodogram peaks in correlated time series
### Aliases: peacots-package peacots
### Keywords: package statistics

### ** Examples

# Generate a cyclic time series and analyse using peacots

# Parameters
lambda         = 1;    # inverse correlation time of OU process
cyclePeriod    = 1;
cycleAmplitude = 0.6;
times          = seq(0,20,0.25);

# Example 1

# generate cyclic time series by adding a periodic signal to an OUSS process
signal 	= cycleAmplitude * cos(2*pi*times/cyclePeriod) +
          generate_ouss(times, mu=0, sigma=1, lambda=lambda, epsilon=0.5);

# Find periodogram peak and estimate statistical significance
# Ignore frequencies lower than a pre-defined threshold
# to avoid masking by low-frequency maximum
report 	= evaluate.pm(times=times, signal=signal, 
                      minPeakFreq=lambda/3, 
                      minFitFreq=lambda/3,
                      startRadius=2);

# plot overview of periodogram peak analysis
plotReport(sprintf("Cyclic at frequency %.2g",1/cyclePeriod), 
           times=times, signal=signal, report=report);


# Example 2 (using the same time series)
# In this example we don't use low-frequency trimming
# Instead, we will focus on a particular (local) periodogram peak
# and estimate its 'local' statistical significance

# calculate periodogram and fit OUSS model
report    = evaluate.pm(times=times, signal=signal, startRadius=2);

# find the periodogram mode approximately corresponding to the frequency we are interested in
cycleMode = which(report$frequencies>=0.99/cyclePeriod)[1];

# calculate local P-value for this peak
Pvalue    = significanceOfLocalPeak(power_o     = report$power_o, 
                                    lambda      = report$lambda, 
                                    power_e     = report$power_e, 
                                    time_step   = report$time_step,
                                    series_size = length(times),
                                    Nfreq       = length(report$frequencies), 
                                    peakFreq    = report$frequencies[cycleMode], 
                                    peakPower   = report$periodogram[cycleMode]);

# print result
cat(sprintf("Local P-value = %.3g for peak at frequency=%.3g\n", 
    Pvalue, report$frequencies[cycleMode]));



