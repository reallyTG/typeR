library(weathermetrics)


### Name: convert_wind_speed
### Title: Convert between wind speed metrics
### Aliases: convert_wind_speed

### ** Examples


data(beijing)
beijing$knots <- convert_wind_speed(beijing$kmph,
   old_metric = "kmph", new_metric = "knots")
beijing

data(foco)
foco$mph <- convert_wind_speed(foco$knots, old_metric = "knots",
   new_metric = "mph", round = 0)
foco$mph <- convert_wind_speed(foco$knots, old_metric = "knots",
   new_metric = "mps", round = NULL)
foco$kmph <- convert_wind_speed(foco$mph, old_metric = "mph",
   new_metric = "kmph")
foco




