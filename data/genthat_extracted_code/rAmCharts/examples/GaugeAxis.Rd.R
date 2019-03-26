library(rAmCharts)


### Name: initialize,GaugeAxis-method
### Title: Initializes a GaugeAxis
### Aliases: initialize,GaugeAxis-method gaugeAxis setBands
###   setBands,GaugeAxis,list-method addBand
###   addBand,GaugeAxis,GaugeBandOrMissing-method

### ** Examples

# --- method initialize
new("GaugeAxis", alpha = 1)

# -- constructor
gaugeAxis()

# -- update 'bands' at once
bands <- list(gaugeBand(startValue = 70, endValue = 90),
              gaugeBand(startValue = 40, endValue = 60))
gaugeAxis(bands = bands)

# --- add 'band' one by one one
addBand(.Object = gaugeAxis(), startValue = 0, endValue = 100)
# equivalent to
gaugeBand_obj <- gaugeBand(startValue = 0, endValue = 100)
addBand(.Object = gaugeAxis(), band = gaugeBand_obj)




