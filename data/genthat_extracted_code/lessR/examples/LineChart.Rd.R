library(lessR)


### Name: LineChart
### Title: Line Chart such as a Run Chart or Time-Series Chart
### Aliases: LineChart lc
### Keywords: plot line chart run chart time series chart

### ** Examples

# create data frame, d, to mimic reading data with Read function
# d contains both numeric and non-numeric data
d <- data.frame(rnorm(50), rnorm(50), rnorm(50), rep(c("A","B"),25))
names(d) <- c("X","Y","Z","C")

# default run chart
LineChart(Y)
# short name
lc(Y)

# save run chart to a pdf file
LineChart(Y, pdf=TRUE)

# LineChart in gray scale, then back to default theme
style("gray")
LineChart(Y)
style()
  
# customize run chart with LineChart options
style(panel.fill="mintcream", color="sienna3")
LineChart(Y, line.width=2, area="slategray3", center.line="median")
style()  # reset style

# customize run chart with R par parameters
# 24 is the R value for a half-triangle pointing up
lc(Y, xlab="My xaxis", ylab="My yaxis", main="My Best Title",
   cex.main=1.5, font.main=3, ylim=c(-4,4), shape.pts=24)
  
# generate steadily increasing values
# get a variable named A in the user workspace
A <- sort(rexp(50))
# default line chart
LineChart(A)
# line chart with border around plotted values
LineChart(A, area="off")
# time series chart, i.e., with dates, and filled area
# with option label for the x-axis
LineChart(A, time.start="2000/09/01", time.by="3 months")
# time series chart from a time series object
y.ts <- ts(A, start=c(2000, 9), frequency=4)
LineChart(y.ts)

# LineChart with built-in data set
LineChart(breaks, data=warpbreaks)

# Line charts for all numeric variables in a data frame
LineChart()

# Line charts for all specified numeric variables in a list of variables
# e.g., use the combine or c function to specify a list of variables
LineChart(c(X,Y))



