library(MetFns)


### Name: filter.totcor
### Title: Selection of visual meteor data by total correction factor
### Aliases: filter.totcor

### ** Examples

## select 2015 visual meteor rate data during the period between 10-25 October and then
## select observations of Orionids with total correction factor smaller or equal to 5
rateOct<-filter.date(rate2015,date.start="2015-10-10",date.end="2015-10-25")
filter.totcor(rateOct,shw="ORI",r=2.5,C=5)



