library(SensusR)


### Name: plot.AltitudeDatum
### Title: Plot altitude data.
### Aliases: plot.AltitudeDatum

### ** Examples

data.path = system.file("extdata", "example-data", package="SensusR")
data = sensus.read.json.files(data.path)
plot(data$AltitudeDatum)



