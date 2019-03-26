library(hydroTSM)


### Name: monthlyfunction
### Title: Monthly Function
### Aliases: monthlyfunction monthlyfunction.zoo monthlyfunction.default
###   monthlyfunction.matrix monthlyfunction.data.frame
### Keywords: manip

### ** Examples

## Loading daily streamflows (3 years) at the station 
## Oca en Ona (Ebro River basin, Spain)
data(OcaEnOnaQts)
x <- OcaEnOnaQts

## Mean monthly streamflows at station 'x'
monthlyfunction(x, FUN=mean, na.rm=TRUE)


############################
## Boxplot of monthly values

## Daily to Monthly
m <- daily2monthly(x, FUN=mean, na.rm=TRUE)

## Median of the monthly values at the station
monthlyfunction(m, FUN=median, na.rm=TRUE)

## Vector with the three-letter abbreviations of the month names
cmonth <- format(time(m), "%b")

## Creating ordered monthly factors
months <- factor(cmonth, levels=unique(cmonth), ordered=TRUE)

## Boxplot of the monthly values
boxplot( coredata(m) ~ months, col="lightblue", main="Monthly streamflows, [m3/s]")


##############################
##############################
## Loading the monthly time series of precipitation within the Ebro River basin.
data(EbroPPtsMonthly)
x <- EbroPPtsMonthly

## Dates of 'x'
dates <- as.Date(x[,1])

## Monthly precipitation of all the stations in 'x'
## Not run: 
##D 
##D ## Sum of the monthly values in each station of 'x'
##D z <- zoo( x[, 2:ncol(x)], dates)
##D 
##D # Amount of years in 'x' (needed for computing the average)
##D nyears <- yip(from=start(z), to=end(z), out.type="nmbr" )
##D 
##D m <- monthlyfunction(z, FUN=sum)
##D 
##D 
##D ## Another way of computing the sum of the monthly values in each station of 'x'
##D ## This way is usefult for posteriori boxplots
##D m2 <- monthlyfunction(x, FUN=sum, dates=1, out.type="db")
##D 
##D ## Average monthly precipitation in each station of 'x'
##D m2$Value <- m2$Value / nyears 
##D 
##D ## Creating monthly factors
##D m2$Month <- factor(m2$Month, levels=month.abb)
##D 
##D ## boxplot of the monthly values in all stations
##D boxplot(Value ~ Month, m2, col="lightyellow", main="Monthly Precipitation, [mm/month]")
## End(Not run)




