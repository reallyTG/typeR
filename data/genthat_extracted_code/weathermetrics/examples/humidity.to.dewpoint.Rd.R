library(weathermetrics)


### Name: humidity.to.dewpoint
### Title: Calculate dew point temperature.
### Aliases: humidity.to.dewpoint

### ** Examples

# Calculate dew point temperature from relative humidity and
# air temperature.

data(newhaven)
newhaven$DP <- humidity.to.dewpoint(t = newhaven$TemperatureF,
                                    rh = newhaven$Relative.Humidity,
                                    temperature.metric = 'fahrenheit')
newhaven




