library(SensusR)


### Name: plot.BatteryDatum
### Title: Plot battery data.
### Aliases: plot.BatteryDatum

### ** Examples

data.path = system.file("extdata", "example-data", package="SensusR")
data = sensus.read.json.files(data.path)
plot(data$BatteryDatum)



