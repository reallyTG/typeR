library(hydroTSM)


### Name: hydroplot
### Title: Hydrological time series plotting and extraction.
### Aliases: sname2plot hydroplot
### Keywords: graphs manip

### ** Examples

#############
## Loading daily streamflows at the station Oca en Ona (Ebro River basin, Spain) ##
data(OcaEnOnaQts)

## 3 ts, 3 boxplots and 3 histograms
hydroplot(OcaEnOnaQts, FUN=mean, ylab= "Q", var.unit = "m3/s")

## only the original time series
hydroplot(OcaEnOnaQts, pfreq="o")

## only the year 1962 of the original time series
hydroplot(OcaEnOnaQts, pfreq="o", from="1962-01-01", to="1962-12-31")

## seasonal plots
## Not run: 
##D hydroplot(OcaEnOnaQts, pfreq="seasonal", FUN=mean, stype="default")
##D 
##D ## custom season names (let's assume to be in the Southern Hemisphere)
##D hydroplot(OcaEnOnaQts, pfreq="seasonal", FUN=mean, 
##D           stype="default", season.names=c("Summer","Autumn", "Winter","Spring"))
## End(Not run)

#############
## Loading the monthly time series of precipitation within the Ebro River basin.
data(EbroPPtsMonthly)

## Plotting the monthly and annual values of precipitation at station "P9001", 
## stored in 'EbroPPtsMonthly'.
sname2plot(EbroPPtsMonthly, sname="P9001", var.type="Precipitation", dates=1, 
           pfreq="ma")

## Plotting seasonal precipitation at station "P9001"
par(mar=c(5.1, 4.1, 4.1, 2.1))

sname2plot(EbroPPtsMonthly, sname="P9001", FUN=sum, dates=1, pfreq="seasonal", 
           stype="default")




