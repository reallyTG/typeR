library(weathermetrics)


### Name: dewpoint.to.humidity
### Title: Calculate relative humidity.
### Aliases: dewpoint.to.humidity

### ** Examples

# Calculate relative humidity from air temperature and
# dew point temperature.

data(lyon)
lyon$RH <- dewpoint.to.humidity(t = lyon$TemperatureC,
                                dp = lyon$DewpointC,
                                temperature.metric = 'celsius')
lyon




