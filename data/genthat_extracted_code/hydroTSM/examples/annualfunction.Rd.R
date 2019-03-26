library(hydroTSM)


### Name: annualfunction
### Title: Annual Function
### Aliases: annualfunction annualfunction.default annualfunction.zoo
###   annualfunction.data.frame annualfunction.matrix
### Keywords: manip

### ** Examples

## Loading the SanMartino daily precipitation data (1921-1990)
data(SanMartinoPPts)
x <- SanMartinoPPts

# Amount of years in 'x' (needed for computing the average)
nyears <- length( seq(from=time(x[1]), to=time(x[length(x)]), by="years") )

## Average annual precipitation for the 70 years period. 
# It is necessary to divide by the amount of years to obtain the average annual value, 
# otherwise it will give the total precipitation for all the 70 years.
annualfunction(x, FUN=sum, na.rm=TRUE) / nyears


#####################
### verification ####
# Daily to annual
a <- daily2annual(x, FUN=sum, na.rm=TRUE)

# Mean annual value
mean(a)

##############################
##############################
## Loading the monthly time series of precipitation within the Ebro River basin.
data(EbroPPtsMonthly)
x <- EbroPPtsMonthly

## Dates of 'x'
dates <- as.Date(x[,1])


## Computation of the average annual precipitation
## Not run: 
##D 
##D ## Transforming 'x' into a zoo object
##D z <- zoo( x[, 2:ncol(x)], dates)
##D 
##D # Amount of years in 'x' (needed for computing the average)
##D nyears <- yip(from=start(z), to=end(z), out.type="nmbr" )
##D 
##D ## Average annual precipitation, for the first 5 stations in 'x'
##D annualfunction(z[ ,1:5], FUN=sum)/nyears
##D  
## End(Not run)




