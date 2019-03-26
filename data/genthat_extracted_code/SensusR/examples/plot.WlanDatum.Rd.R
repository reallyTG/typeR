library(SensusR)


### Name: plot.WlanDatum
### Title: Plot WLAN data.
### Aliases: plot.WlanDatum

### ** Examples

data.path = system.file("extdata", "example-data", package="SensusR")
data = sensus.read.json.files(data.path)
plot(data$WlanDatum)



