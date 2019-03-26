library(openair)


### Name: summaryPlot
### Title: Function to rapidly provide an overview of air quality data
### Aliases: summaryPlot
### Keywords: methods

### ** Examples



# load example data from package
data(mydata)

# do not clip density plot data
## Not run: summaryPlot(mydata, clip = FALSE)

# exclude highest 5 % of data etc.
## Not run: summaryPlot(mydata, percentile = 0.95)

# show missing data where there are at least 96 contiguous missing
# values (4 days)
## Not run: summaryPlot(mydata, na.len = 96)

# show data in green
## Not run: summaryPlot(mydata, col.data = "green")

# show missing data in yellow
## Not run: summaryPlot(mydata, col.mis = "yellow")

# show density plot line in black
## Not run: summaryPlot(mydata, col.dens = "black")





