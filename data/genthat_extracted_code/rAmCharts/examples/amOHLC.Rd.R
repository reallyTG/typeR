library(rAmCharts)


### Name: amOHLC
### Title: Plotting OHLC chart
### Aliases: amOHLC

### ** Examples

data("data_candleStick2")
amOHLC(data = data_candleStick2)

## No test: 
# Other examples available which can be time consuming depending on your configuration.
require(pipeR)

# Change colors
amOHLC(data = data_candleStick2, positiveColor = "green", negativeColor = "red")

# Naming the axes
amOHLC(data = data_candleStick2, xlab = "categories", ylab = "values") %>>% setChartCursor()

# Rotate the labels for x axis
amOHLC(data = data_candleStick2, labelRotation = 90)

# Change names
amOHLC(data = data_candleStick2, names = c("min", "begin", "end", "max")) %>>% setChartCursor()

# Use amOptions
amOHLC(data = data_candleStick2, zoom = FALSE)
## End(No test)




