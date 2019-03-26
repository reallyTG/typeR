library(MetFns)


### Name: filter
### Title: Global filter
### Aliases: filter

### ** Examples

## select rate data for Orionids activity from 10th to 25th October, 
## limiting magnitudes above 5, radiant elevation above 20 degrees, percentage of clouds below 20
filter(rate2015,date.start="2015-10-10",date.end="2015-10-25",shw="ORI",P.up=20,mag.low=5,h.low=20)



