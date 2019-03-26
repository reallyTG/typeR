library(SensusR)


### Name: sensus.get.all.timestamp.lags
### Title: Get timestamp lags for a Sensus data frame.
### Aliases: sensus.get.all.timestamp.lags

### ** Examples

data.path = system.file("extdata", "example-data", package="SensusR")
data = sensus.read.json.files(data.path)
lags = sensus.get.all.timestamp.lags(data)
plot(lags[["AccelerometerDatum"]])



