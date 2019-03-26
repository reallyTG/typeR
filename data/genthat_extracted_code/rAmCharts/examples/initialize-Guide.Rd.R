library(rAmCharts)


### Name: initialize,Guide-method
### Title: Initializes a Guide
### Aliases: initialize,Guide-method guide setFillAlpha
###   setFillAlpha,Guide,numeric-method
###   setValueAxis,Guide,ValueAxisOrCharacterOrMissing-method

### ** Examples

# --- method initialize
new("Guide", fillAlpha = 0.1, gridThickness = 1, value = 1)

# --- constructor
guide(fillAlpha = .4, value = 1)
guide(fillAlpha = .4, adjustBorderColor = TRUE, gridThickness = 1)

setFillAlpha(.Object = guide(), fillAlpha = 1)
valueAxis_obj <- valueAxis(test = "foo")
setValueAxis(.Object = guide(), valueAxis = valueAxis_obj)



