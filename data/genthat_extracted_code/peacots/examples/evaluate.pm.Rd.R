library(peacots)


### Name: evaluate.pm
### Title: Evaluate the periodogram maximum of a time series
### Aliases: evaluate.pm
### Keywords: statistics

### ** Examples

# In this example we generate a cyclic time series
# and analyse its periodogram using evaluate.pm

# Parameters
lambda         = 1;    # inverse correlation time of OU process
cyclePeriod    = 1;    # Cycle period
cycleAmplitude = 0.6;
times          = seq(0,20,0.25);

# generate cyclic time series by adding a periodic signal to an OUSS process
signal = cycleAmplitude * cos(2*pi*times/cyclePeriod) +
         generate_ouss(times, mu=0, sigma=1, lambda=lambda, epsilon=0.5);

# Find periodogram peak and estimate statistical significance
# Ignore frequencies lower than a pre-defined threshold
# to avoid masking by low-frequency maximum
report = evaluate.pm(times=times, signal=signal, 
                     minPeakFreq=lambda/3, 
                     minFitFreq=lambda/3,
                     startRadius=2);

# plot overview of periodogram peak analysis
plotReport(sprintf("Cyclic at frequency %.2g",1/cyclePeriod), 
           times=times, signal=signal, report=report);     
      



