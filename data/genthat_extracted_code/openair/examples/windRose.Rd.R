library(openair)


### Name: windRose
### Title: Traditional wind rose plot and pollution rose variation
### Aliases: windRose pollutionRose
### Keywords: methods

### ** Examples


# load example data from package data(mydata)

# basic plot
windRose(mydata)

# one windRose for each year
windRose(mydata,type = "year")

# windRose in 10 degree intervals with gridlines and width adjusted
## Not run: 
##D windRose(mydata, angle = 10, width = 0.2, grid.line = 1)
## End(Not run)

# pollutionRose of nox
pollutionRose(mydata, pollutant = "nox")

## source apportionment plot - contribution to mean
## Not run: 
##D pollutionRose(mydata, pollutant = "pm10", type = "year", statistic = "prop.mean")
## End(Not run)

## example of comparing 2 met sites
## first we will make some new ws/wd data with a postive bias
mydata$ws2 = mydata$ws + 2 * rnorm(nrow(mydata)) + 1
mydata$wd2 = mydata$wd + 30 * rnorm(nrow(mydata)) + 30

## need to correct negative wd
id <- which(mydata$wd2 < 0)
mydata$wd2[id] <- mydata$wd2[id] + 360

## results show postive bias in wd and ws
pollutionRose(mydata, ws = "ws", wd = "wd", ws2 = "ws2", wd2 = "wd2")



