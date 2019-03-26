library(MetFns)


### Name: filter.mag
### Title: Selection of visual meteor data by limiting magnitude
### Aliases: filter.mag

### ** Examples

## select visual meteor rate data for 13th August 2015, limiting magnitude between 5.5 and 6.5
rate_13.08<-filter.date(rate2015,date.start="2015-08-13",date.end="2015-08-13")
filter.mag(rate_13.08,mag.low=5.5,mag.up=6.5)

## select visual meteor rate data for the 13th August 2015 and limiting magnitude above 6
filter.mag(rate_13.08,mag.low=6)



