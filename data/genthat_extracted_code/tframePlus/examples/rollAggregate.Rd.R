library(tframePlus)


### Name: rollAggregate
### Title: Rolling Time Series Aggregate
### Aliases: rollAggregate
### Keywords: utilities ts

### ** Examples

  rollAggregate(ts(1:20, start = c(1999,1), frequency=1)) 
  rollAggregate(ts(1:20, start = c(1999,1), frequency=12), aggPeriods=3) 
  
  if(require("zoo")) {
    z <- zoo(rnorm(100),  order.by = Sys.Date() + 1:100)
    rollAggregate(as.weekly(z), aggPeriods=4, FUN=mean)
    require("tfplot")
    tfplot(as.weekly(z),rollAggregate(as.weekly(z), aggPeriods=4, 
       FUN=mean, na.rm=TRUE))
    tfplot(z,rollAggregate(z, aggPeriods=28, FUN=mean))
    }



