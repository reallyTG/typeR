library(divDyn)


### Name: streaklog
### Title: Utility functions for slicing gappy time series
### Aliases: streaklog whichmaxstreak

### ** Examples

# generate a sequence of values
  b<-40:1
# add some gaps
  b[c(1:4, 15, 19, 23:27)]  <- NA
# the functions
  streaklog(b)
  whichmaxstreak(b)



