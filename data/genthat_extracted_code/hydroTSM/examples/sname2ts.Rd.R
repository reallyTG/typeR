library(hydroTSM)


### Name: sname2ts
### Title: Station Name -> Time Series
### Aliases: sname2ts
### Keywords: manip

### ** Examples

## Loading the monthly time series of precipitation within the Ebro River basin.
data(EbroPPtsMonthly)

## Annual values of temperature at the station "T9105", stored in 'EbroPPtsMonthly'.
sname2ts(EbroPPtsMonthly, sname="P9001", dates=1, FUN=sum, tstep.out="annual")



