library(spTimer)


### Name: spT.time
### Title: Timer series information.
### Aliases: spT.time
### Keywords: spT

### ** Examples

## 

# Equal length time-series in each of 3 years
time.data<-spT.time(t.series=365,segments=3)

# Un-equal length time-series in 5 years
time.data<-spT.time(t.series=c(366, 365, 365, 365, 366),segments=5)

##



