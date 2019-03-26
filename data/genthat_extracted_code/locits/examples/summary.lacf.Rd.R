library(locits)


### Name: summary.lacf
### Title: Summarizes a lacf object
### Aliases: summary.lacf
### Keywords: ts

### ** Examples

#
# Make some dummy data, e.g. white noise
#
v <- rnorm(256)
#
# Compute the localized autocovariance (ok, the input is stationary
# but this is just an example. More interesting things could be achieved
# by putting the results of simulating from a LSW process, or piecewise
# stationary by concatenating different stationary realizations, etc.
#
vlacf <- lacf(v, lag.max=20)
#
# Now let's summarize the lacf object
#
summary(vlacf)
#Name of originating time series:  
#Date produced:  Thu Oct 25 12:11:29 2012 
#Number of times:  256 
#Number of lags:  20  



