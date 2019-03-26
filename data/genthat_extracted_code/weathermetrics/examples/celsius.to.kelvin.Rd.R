library(weathermetrics)


### Name: celsius.to.kelvin
### Title: Convert from Celsius to Kelvin.
### Aliases: celsius.to.kelvin

### ** Examples

# Convert from Celsius to Kelvin.
data(lyon)
lyon$TemperatureK <- celsius.to.kelvin(lyon$TemperatureC)
lyon




