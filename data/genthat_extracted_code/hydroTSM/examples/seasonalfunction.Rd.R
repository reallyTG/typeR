library(hydroTSM)


### Name: seasonalfunction
### Title: Seasonal Function
### Aliases: seasonalfunction seasonalfunction.default seasonalfunction.zoo
###   seasonalfunction.data.frame seasonalfunction.matrix
### Keywords: manip

### ** Examples

## Loading the SanMartino precipitation data
data(SanMartinoPPts)
x <- SanMartinoPPts

# Amount of years
nyears <- yip(from=start(x), to=end(x), out.type="nmbr")

## Mean annual precipitation.
# It is necessary to divide by the amount of years to obtain the mean annual value, 
# otherwise it will give the total precipitation for all the 70 years
seasonalfunction(x, FUN=sum, na.rm=TRUE) / nyears

#####################
### verification ####
# Mean winter (DJF) value
sum( extractzoo(x, trgt="DJF") ) / nyears

# Mean spring (MAM) value
sum( extractzoo(x, trgt="MAM") ) / nyears

# Mean summer (JJA) value
sum( extractzoo(x, trgt="JJA") ) / nyears

# Mean autumn (SON) value
sum( extractzoo(x, trgt="SON") ) / nyears

## Don't show: 
############
############
## Loading the monthly time series of precipitation within the Ebro River basin.
data(EbroPPtsMonthly)
x <- EbroPPtsMonthly

## Winter (DJF) mean values of precipitation for the first 3 stations 
## in 'EbroPPtsMonthly' (its first column stores the dates)
seasonalfunction(x[,1:4], FUN=mean, dates=1)

## The same previous example, but using a zoo object
dates <- as.Date(x[,1]) # dates of the zoo object
z     <- zoo(x[ ,2:ncol(x)], dates) # zoo creation
seasonalfunction(z, FUN=mean)
## End(Don't show)




