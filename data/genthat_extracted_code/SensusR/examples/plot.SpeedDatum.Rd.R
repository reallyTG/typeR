library(SensusR)


### Name: plot.SpeedDatum
### Title: Plot speed data.
### Aliases: plot.SpeedDatum

### ** Examples

data.path = system.file("extdata", "example-data", package="SensusR")
data = sensus.read.json.files(data.path)
plot(data$SpeedDatum)



