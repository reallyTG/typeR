library(MetFns)


### Name: filter.h
### Title: Selection of visual meteor data by radiant elevation
### Aliases: filter.h

### ** Examples

## select visual meteor rate data for the elevation of Orionids radiant between 20 and 90 degrees,
## period between 10-25th October 2015
rateOri<-filter.date(rate2015,"2015-10-10","2015-10-25")
filter.h(rateOri,shw="ORI", h.low=20)



