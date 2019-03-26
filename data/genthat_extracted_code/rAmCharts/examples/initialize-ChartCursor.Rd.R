library(rAmCharts)


### Name: initialize,ChartCursor-method
### Title: Initializes a ChartCursor
### Aliases: initialize,ChartCursor-method chartCursor setOneBalloonOnly
###   setOneBalloonOnly,ChartCursor,logical-method setValueLineAxis
###   setValueLineAxis,ChartCursor,ValueAxisOrCharacterOrMissing-method

### ** Examples

new("ChartCursor", oneBalloonOnly = TRUE)

chartCursor()
chartCursor(oneBalloonOnly = TRUE)

setOneBalloonOnly(.Object = chartCursor(), oneBalloonOnly = TRUE)
setValueLineAxis(.Object = chartCursor(), id = "valueAxis1",
                 title = "Hello !", axisTitleOffset = 12)
# equivalent to:
valueLineAxis_obj <- valueAxis(id = "valueAxis1", title = "Hello !", axisTitleOffset = 12)
setValueLineAxis(.Object = chartCursor(), valueLineAxis  = valueLineAxis_obj)
# or iff 'valueLineAxis_obj' has already been added to the chart:
setValueLineAxis(.Object = chartCursor(), valueLineAxis  = "valueAxis1")



