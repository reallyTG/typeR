library(hydroTSM)


### Name: dwdays
### Title: Amount of dry/wet days in a time series
### Aliases: dwdays.data.frame dwdays.matrix dwdays.default dwdays
### Keywords: manip

### ** Examples

## Loading the SanMartino precipitation data
data(SanMartinoPPts)
x <- SanMartinoPPts

## Average amount of wet days in each month (for this example, this means days 
## with precipitation larger than 0.1mm) 
dwdays(x, thr=0.1)



