library(hydroTSM)


### Name: dm2seasonal
### Title: (sub)Daily/Monthly -> Seasonal Values
### Aliases: dm2seasonal dm2seasonal.default dm2seasonal.zoo
###   dm2seasonal.data.frame dm2seasonal.matrix subdaily2seasonal
###   subdaily2seasonal.default subdaily2seasonal.zoo
###   subdaily2seasonal.data.frame subdaily2seasonal.matrix
### Keywords: manip

### ** Examples

############
## Loading the DAILY precipitation data at SanMartino
data(SanMartinoPPts)
x <- SanMartinoPPts

## Winter (DJF) values of precipitation for each year of 'x'
dm2seasonal(x, FUN=sum, season="DJF")

############
## Loading the HOURLY discharge data for the Karamea at Gorge streamgauge station
data(KarameaAtGorgeQts)
x <- KarameaAtGorgeQts

## Mean winter (DJF) values of streamflow for each year of 'x'
dm2seasonal(x, FUN=mean, season="DJF")
subdaily2seasonal(x, FUN=mean, season="DJF") # same as above


## Don't show: 
############
############
## Loading the monthly time series of precipitation within the Ebro River basin.
data(EbroPPtsMonthly)
x <- EbroPPtsMonthly

## Winter (DJF) values of precipitation for the first 3 stations 
## in 'EbroPPtsMonthly' (its first column stores the dates)
dm2seasonal(x[,1:4], FUN=sum, season="DJF", dates=1)

## The same previous example, but using a zoo object
dates <- as.Date(x[,1]) # dates of the zoo object
z     <- zoo(x[ ,2:ncol(x)], dates) # zoo creation
dm2seasonal(z, FUN=sum, season="DJF")
## End(Don't show)




