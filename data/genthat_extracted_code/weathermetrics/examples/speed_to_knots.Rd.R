library(weathermetrics)


### Name: speed_to_knots
### Title: Convert between standard units of measure for wind speed
### Aliases: speed_to_knots

### ** Examples

data(beijing)
beijing$knots <- speed_to_knots(beijing$kmph, unit = "kmph", round = 2)
beijing




