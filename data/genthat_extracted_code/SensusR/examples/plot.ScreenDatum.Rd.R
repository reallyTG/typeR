library(SensusR)


### Name: plot.ScreenDatum
### Title: Plot screen data.
### Aliases: plot.ScreenDatum

### ** Examples

data.path = system.file("extdata", "example-data", package="SensusR")
data = sensus.read.json.files(data.path)
plot(data$ScreenDatum)



