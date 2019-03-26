library(openair)


### Name: calendarPlot
### Title: Plot time series values in convential calendar format
### Aliases: calendarPlot
### Keywords: methods

### ** Examples



# load example data from package
data(mydata)

# basic plot
calendarPlot(mydata, pollutant = "o3", year = 2003)

# show wind vectors
calendarPlot(mydata, pollutant = "o3", year = 2003, annotate = "wd")
## Not run: 
##D # show wind vectors scaled by wind speed and different colours
##D calendarPlot(mydata, pollutant = "o3", year = 2003, annotate = "ws",
##D cols = "heat")
##D 
##D # show only specific months with selectByDate
##D calendarPlot(selectByDate(mydata, month = c(3,6,10), year = 2003),
##D pollutant = "o3", year = 2003, annotate = "ws", cols = "heat")
##D 
##D # categorical scale example
##D calendarPlot(mydata, pollutant = "no2", breaks = c(0, 50, 100, 150, 1000),
##D labels = c("Very low", "Low", "High", "Very High"),
##D cols = c("lightblue", "green", "yellow",  "red"), statistic = "max")
##D 
## End(Not run)




