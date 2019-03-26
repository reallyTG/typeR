library(SensusR)


### Name: plot.CompassDatum
### Title: Plot compass data.
### Aliases: plot.CompassDatum

### ** Examples

data.path = system.file("extdata", "example-data", package="SensusR")
data = sensus.read.json.files(data.path)
plot(data$CompassDatum)



