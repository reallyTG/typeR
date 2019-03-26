library(openair)


### Name: scatterPlot
### Title: Flexible scatter plots
### Aliases: scatterPlot
### Keywords: methods

### ** Examples


# load openair data if not loaded already
data(mydata)

# basic use, single pollutant

scatterPlot(mydata, x = "nox", y = "no2")

# scatterPlot by year
scatterPlot(mydata, x = "nox", y = "no2", type = "year")

# scatterPlot by day of the week, removing key at bottom
scatterPlot(mydata, x = "nox", y = "no2", type = "weekday", key =
FALSE)

# example of the use of continuous where colour is used to show
# different levels of a third (numeric) variable
# plot daily averages and choose a filled plot symbol (pch = 16)
# select only 2004
## Not run: 
##D dat2004 <- selectByDate(mydata, year = 2004)
##D scatterPlot(dat2004, x = "nox", y = "no2", z = "co", avg.time = "day", pch = 16)
##D 
##D # show linear fit, by year
##D scatterPlot(mydata, x = "nox", y = "no2", type = "year", smooth =
##D FALSE, linear = TRUE)
##D 
##D # do the same, but for daily means...
##D scatterPlot(mydata, x = "nox", y = "no2", type = "year", smooth =
##D FALSE, linear = TRUE, avg.time = "day")
##D 
##D # log scales
##D scatterPlot(mydata, x = "nox", y = "no2", type = "year", smooth =
##D FALSE, linear = TRUE, avg.time = "day", log.x = TRUE, log.y = TRUE)
##D 
##D # also works with the x-axis in date format (alternative to timePlot)
##D scatterPlot(mydata, x = "date", y = "no2", avg.time = "month",
##D key = FALSE)
##D 
##D ## multiple types and grouping variable and continuous colour scale
##D scatterPlot(mydata, x = "nox", y = "no2", z = "o3", type = c("season", "weekend"))
##D 
##D # use hexagonal binning
##D 
##D library(hexbin)
##D # basic use, single pollutant
##D scatterPlot(mydata, x = "nox", y = "no2", method = "hexbin")
##D 
##D # scatterPlot by year
##D scatterPlot(mydata, x = "nox", y = "no2", type = "year", method =
##D "hexbin")
##D 
##D 
##D ## bin data and plot it - can see how for high NO2, O3 is also high
##D 
##D scatterPlot(mydata, x = "nox", y = "no2", z = "o3", method = "level", dist = 0.02)
##D 
##D 
##D ## fit surface for clearer view of relationship - clear effect of
##D ## increased O3
##D 
##D scatterPlot(mydata, x = "nox", y = "no2", z = "o3", method = "level",
##D x.inc = 10, y.inc = 2, smooth = TRUE)
## End(Not run)





