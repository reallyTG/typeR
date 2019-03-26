library(weathermetrics)


### Name: fahrenheit.to.kelvin
### Title: Convert from Fahrenheit to Kelvin.
### Aliases: fahrenheit.to.kelvin

### ** Examples

# Convert from Fahrenheit to Kelvin.
data(norfolk)
norfolk$TempuratureK <- fahrenheit.to.kelvin(norfolk$TemperatureF)
norfolk




