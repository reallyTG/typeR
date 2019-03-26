library(openair)


### Name: polarFreq
### Title: Function to plot wind speed/direction frequencies and other
###   statistics
### Aliases: polarFreq
### Keywords: methods

### ** Examples



# basic wind frequency plot
polarFreq(mydata)

# wind frequencies by year
## Not run: polarFreq(mydata, type = "year")


# mean SO2 by year, showing only bins with at least 2 points
## Not run: polarFreq(mydata, pollutant = "so2", type = "year", statistic = "mean", min.bin = 2)

# weighted mean SO2 by year, showing only bins with at least 2 points
## Not run: 
##D polarFreq(mydata, pollutant = "so2", type = "year", statistic = "weighted.mean",
##D min.bin = 2)
## End(Not run)

#windRose for just 2000 and 2003 with different colours
## Not run: 
##D polarFreq(subset(mydata, format(date, "%Y") %in% c(2000, 2003)),
##D type = "year", cols = "jet")
## End(Not run)

# user defined breaks from 0-700 in intervals of 100 (note linear scale)
## Not run: polarFreq(mydata, breaks = seq(0, 700, 100))

# more complicated user-defined breaks - useful for highlighting bins
# with a certain number of data points
## Not run: polarFreq(mydata, breaks = c(0, 10, 50, 100, 250, 500, 700))

# source contribution plot and use of offset option
## Not run: 
##D polarFreq(mydata, pollutant = "pm25", statistic
##D ="weighted.mean", offset = 50, ws.int = 25, trans = FALSE) 
## End(Not run)




