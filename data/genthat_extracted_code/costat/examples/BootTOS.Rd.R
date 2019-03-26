library(costat)


### Name: BootTOS
### Title: Perform bootstrap stationarity test for time series
### Aliases: BootTOS
### Keywords: ts

### ** Examples

#
# Calculate test of stationarity on example we know to be stationary,
# a series of iid values
#
plot(BootTOS(rnorm(64), Bsims=10), plot=FALSE)
#
# The following text is what gets printed
#
#Realized Bootstrap is  0.04543729 
#p-value is  0.93 
#Series was stationary
#[1] 0.93
#
# The realized bootstrap value is the value of the test statistic on the
# actual data (0.0454 here).
#
# The p-value is also printed (this is just the number of simulated series
# test statistic values less than the actual test statistic) and returned.
#
# The text "Series is stationary" just means that the empirical p-value
# was greater than the nominal test size (alpha=0.05, by default).
#
# Let's now try another example with the series sret: note that if you
# have a slow single core machine, this can take a long time, so we don't
# run it in the examples. However, on a fastish machine it is quick, on
# a fast multicore machine it is really quick!
#
## Not run: plot(BootTOS(sret))
#
#Realized Bootstrap is  2.662611e-09 
#p-value is  0 
#Series was NOT stationary
#[1] 0
#
# In contrast to the previous example, the p-value is 0, hence indicative
# of non-stationarity.
#



