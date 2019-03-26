library(MetFns)


### Name: solar.long
### Title: Vectorized calculation of solar longitude
### Aliases: solar.long

### ** Examples

## calculate solar longitudes corresponding to the middle of time intervals 
## of 2015 Orionids rate data
## first select Orionids from 2015 rate data
rateOri<-filter.shw(rate2015,shw="ORI")

## calculate middle of observing time intervals of 2015 Orionids rate data
midintOri<-midint(rateOri)

## calculate solar longitudes corresponding to the middle of time intervals
solar.long(midintOri)




