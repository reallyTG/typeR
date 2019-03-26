library(ftsa)


### Name: extract
### Title: Extract variables or observations
### Aliases: extract
### Keywords: models

### ** Examples

# ElNino is an object of class sliced functional time series.
# This function truncates the data series rowwise or columnwise.	
extract(data = ElNino, direction = "time", timeorder = 1980:2006) # Last 27 curves
extract(data = ElNino, direction = "x", xorder = 1:8) # First 8 x variables



