library(weathermetrics)


### Name: convert_temperature
### Title: Convert from one temperature metric to another
### Aliases: convert_temperature

### ** Examples

data(lyon)
lyon$TemperatureF <- convert_temperature(lyon$TemperatureC,
   old_metric = "c", new_metric = "f")
lyon

data(norfolk)
norfolk$TempC <- convert_temperature(norfolk$TemperatureF,
   old_metric = "f", new_metric = "c")
norfolk

data(angeles)
angeles$TemperatureC <- convert_temperature(angeles$TemperatureK,
   old_metric = "kelvin", new_metric = "celsius")
angeles




