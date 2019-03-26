library(rAmCharts)


### Name: initialize,GaugeArrow-method
### Title: Initializes a GaugeArrow
### Aliases: initialize,GaugeArrow-method gaugeArrow setAxis
###   setAxis,GaugeArrow,GaugeAxisOrCharacterOrMissing-method

### ** Examples

# --- method initialize
new("GaugeArrow", alpha = 2)

# --- constructor
gaugeArrow(value = 10)

# -- update 'axis' property
setAxis(.Object = gaugeArrow(), id = "axis1", startValue = 0,
        endValue = 100, valueInterval = 10)
# equivalent to:
axis_obj <- gaugeAxis(id = "axis1", startValue = 0, endValue = 100, valueInterval = 10)
setAxis(.Object = gaugeArrow(), axis = axis_obj)
# or, iff, 'axis_obj' has already been added to the chart
setAxis(.Object = gaugeArrow(), axis = "axis1")




