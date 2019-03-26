library(SensusR)


### Name: plot.TelephonyDatum
### Title: Plot telephony data.
### Aliases: plot.TelephonyDatum

### ** Examples

data.path = system.file("extdata", "example-data", package="SensusR")
data = sensus.read.json.files(data.path)
plot(data$TelephonyDatum)



