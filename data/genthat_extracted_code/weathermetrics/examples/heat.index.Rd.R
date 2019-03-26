library(weathermetrics)


### Name: heat.index
### Title: Calculate heat index.
### Aliases: heat.index

### ** Examples

# Calculate heat index from temperature (in Fahrenheit)
# and relative humidity.

data(suffolk)
suffolk$heat.index <- heat.index(t = suffolk$TemperatureF,
                                 rh = suffolk$Relative.Humidity)
suffolk

# Calculate heat index (in Celsius) from temperature (in
# Celsius) and dew point temperature (in Celsius).

data(lyon)
lyon$heat.index <- heat.index(t = lyon$TemperatureC,
                              dp = lyon$DewpointC,
                              temperature.metric = 'celsius',
                              output.metric = 'celsius')
lyon




