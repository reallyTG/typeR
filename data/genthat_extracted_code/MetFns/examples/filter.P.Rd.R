library(MetFns)


### Name: filter.P
### Title: Selection of visual meteor data by percentage of field-of-view
###   obstruction
### Aliases: filter.P

### ** Examples

## select visual meteor rate data for the period between 10-25th October 2015 and 
## percentage of field-of-view obstruction below 20%
rateOct<-filter.date(rate2015,date.start="2015-10-10",date.end="2015-10-25")
filter.P(rateOct,P.up=20)



