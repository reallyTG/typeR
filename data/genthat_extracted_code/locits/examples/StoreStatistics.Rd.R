library(locits)


### Name: StoreStatistics
### Title: Interogates calculation store to see how well we are reusing
###   previous calculations (debugging)
### Aliases: StoreStatistics
### Keywords: utilities

### ** Examples

#
# Simulate some data
#
x <- tvar1sim()
#
# Calculate lacf and confidence intervals
#
x.lacf <- Rvarlacf(x=x, nz=50, var.lag.max=20)
#
# Find out how the store did
#
StoreStatistics()
#Number calculated outside framework:  0 
#Number calculated then stored:  154440 
#Number found in store:  14980680 
#
#Overall % calculated:  1.020408 
#% outside framework:  0 



