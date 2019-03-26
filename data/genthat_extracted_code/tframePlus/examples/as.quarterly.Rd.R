library(tframePlus)


### Name: as.quarterly
### Title: Aggregate Time Series
### Aliases: as.weekly as.quarterly as.annually
### Keywords: utilities ts

### ** Examples

  z <- ts(1:10, start = c(1999,2), frequency=4)
  as.annually(z) 
  as.annually(z, na.rm=TRUE)

  z <- ts(1:30, start = c(1999,2), frequency=12)
  as.annually(z) 
  as.annually(z, na.rm=TRUE)
  as.quarterly(z) 
  as.quarterly(z, na.rm=TRUE)




