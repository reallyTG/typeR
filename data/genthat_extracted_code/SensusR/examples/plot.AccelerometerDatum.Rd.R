library(SensusR)


### Name: plot.AccelerometerDatum
### Title: Plot accelerometer data.
### Aliases: plot.AccelerometerDatum

### ** Examples

data.path = system.file("extdata", "example-data", package="SensusR")
data = sensus.read.json.files(data.path)
plot(data$AccelerometerDatum)



