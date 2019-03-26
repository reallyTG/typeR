library(SensusR)


### Name: plot.LightDatum
### Title: Plot light data.
### Aliases: plot.LightDatum

### ** Examples

data.path = system.file("extdata", "example-data", package="SensusR")
data = sensus.read.json.files(data.path)
plot(data$LightDatum)



