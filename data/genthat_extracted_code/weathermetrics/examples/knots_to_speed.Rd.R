library(weathermetrics)


### Name: knots_to_speed
### Title: Convert from knots to standard units of wind speed
### Aliases: knots_to_speed

### ** Examples

data(foco)
foco$mph <- knots_to_speed(foco$knots, unit = "mph", round = 0)
foco$mps <- knots_to_speed(foco$knots, unit = "mps", round = NULL)
foco$ftps <- knots_to_speed(foco$knots, unit = "ftps")
foco$kmph <- knots_to_speed(foco$knots, unit = "kmph")
foco




