library(rAmCharts)


### Name: initialize,TrendLine-method
### Title: Initializes a TrendLine
### Aliases: initialize,TrendLine-method trendLine setInitialValue
###   setInitialValue,TrendLine,numeric-method setInitialXValue
###   setInitialXValue,TrendLine,numeric-method setFinalValue
###   setFinalValue,TrendLine,numeric-method setFinalXValue
###   setFinalXValue,TrendLine,numeric-method
###   setValueAxis,TrendLine,ValueAxisOrCharacterOrMissing-method
###   setValueAxisX
###   setValueAxisX,TrendLine,ValueAxisOrCharacterOrMissing-method

### ** Examples

new("TrendLine", initialValue = 1, finalValue = 11)

# Other example
valueAxis <- valueAxis(title = "Hello !", axisTitleOffset = 12)
new("TrendLine", valueAxis = valueAxis)

trendLine(initialValue = 1, finalValue = 11)
setInitialValue(.Object = trendLine(), initialValue = 16)
setInitialXValue(.Object = trendLine(), initialXValue = 16)
setFinalValue(.Object = trendLine(), finalValue = 16)
setFinalXValue(.Object = trendLine(), finalXValue = 16)
setValueAxis(.Object = trendLine(), id = "valueAxis-1",
             title = "Hello !", axisTitleOffset = 12)
# equival to:
valueAxis_obj <- valueAxis(id = "valueAxis-1", title = "Hello !", axisTitleOffset = 12)
trendLine(valueAxis = valueAxis_obj)
# or...
trendLine(valueAxis = "valueAxis-1")
# valid if and only if 'valueAxis_obj' has already been added to the chart

setValueAxisX(.Object = trendLine(), id = "valueAxisX-1",
              title = "Hello !", axisTitleOffset = 12)
# equival to:
valueAxisX_obj <- valueAxis(id = "valueAxisX-1", title = "Hello !", axisTitleOffset = 12)
trendLine(valueAxisX = valueAxisX_obj)
# or...
trendLine(valueAxisX = "valueAxisX-1")
# valid if and only if 'valueAxisX_obj' has already been added to the chart




