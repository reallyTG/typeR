library(weathermetrics)


### Name: fahrenheit.to.celsius
### Title: Convert from Fahrenheit to Celsius.
### Aliases: fahrenheit.to.celsius

### ** Examples

# Convert from Fahrenheit to Celsius.
data(norfolk)
norfolk$TempC <- fahrenheit.to.celsius(norfolk$TemperatureF)
norfolk




