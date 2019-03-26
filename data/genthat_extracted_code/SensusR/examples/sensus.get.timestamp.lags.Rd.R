library(SensusR)


### Name: sensus.get.timestamp.lags
### Title: Get timestamp lags for a Sensus datum.
### Aliases: sensus.get.timestamp.lags

### ** Examples

data.path = system.file("extdata", "example-data", package="SensusR")
data = sensus.read.json.files(data.path)
plot(sensus.get.timestamp.lags(data$AccelerometerDatum))



