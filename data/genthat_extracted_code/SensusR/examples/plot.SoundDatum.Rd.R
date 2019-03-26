library(SensusR)


### Name: plot.SoundDatum
### Title: Plot sound data.
### Aliases: plot.SoundDatum

### ** Examples

data.path = system.file("extdata", "example-data", package="SensusR")
data = sensus.read.json.files(data.path)
plot(data$SoundDatum)



