library(locits)


### Name: print.lacf
### Title: Print lacf class object
### Aliases: print.lacf
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
vlacf <- lacf(v, lag.max=30)
#
# Now let's print the lacf object 
#
print(vlacf)
#Class 'lacf' : Localized Autocovariance/correlation Object:
#       ~~~~  : List with 3 components with names
#             lacf lacr date 
#
#
#summary(.):
#----------
#Name of originating time series:  
#Date produced:  Thu Oct 25 12:11:29 2012 
#Number of times:  256 
#Number of lags:  30 



