library(weathermetrics)


### Name: kelvin.to.celsius
### Title: Convert from Kelvin to Celsius.
### Aliases: kelvin.to.celsius

### ** Examples

# Convert from Kelvin to Celsius.
data(angeles)
angeles$TemperatureC <- kelvin.to.celsius(angeles$TemperatureK)
angeles




