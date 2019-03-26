library(openair)


### Name: timePlot
### Title: Plot time series
### Aliases: timePlot
### Keywords: methods

### ** Examples



# basic use, single pollutant
timePlot(mydata, pollutant = "nox")

# two pollutants in separate panels
## Not run: timePlot(mydata, pollutant = c("nox", "no2"))

# two pollutants in the same panel with the same scale
## Not run: timePlot(mydata, pollutant = c("nox", "no2"), group = TRUE)

# alternative by normalising concentrations and plotting on the same
  scale
## Not run: 
##D timePlot(mydata, pollutant = c("nox", "co", "pm10", "so2"), group = TRUE, avg.time =
##D   "year", normalise = "1/1/1998", lwd = 3, lty = 1)
## End(Not run)

# examples of selecting by date

# plot for nox in 1999
## Not run: timePlot(selectByDate(mydata, year = 1999), pollutant = "nox")

# select specific date range for two pollutants
## Not run: 
##D timePlot(selectByDate(mydata, start = "6/8/2003", end = "13/8/2003"),
##D pollutant = c("no2", "o3"))
## End(Not run)

# choose different line styles etc
## Not run: timePlot(mydata, pollutant = c("nox", "no2"), lty = 1)

# choose different line styles etc
## Not run: 
##D timePlot(selectByDate(mydata, year = 2004, month = 6), pollutant =
##D c("nox", "no2"), lwd = c(1, 2), col = "black")
## End(Not run)

# different averaging times

#daily mean O3
## Not run: timePlot(mydata, pollutant = "o3", avg.time = "day")

# daily mean O3 ensuring each day has data capture of at least 75%
## Not run: timePlot(mydata, pollutant = "o3", avg.time = "day", data.thresh = 75)

# 2-week average of O3 concentrations
## Not run: timePlot(mydata, pollutant = "o3", avg.time = "2 week")




