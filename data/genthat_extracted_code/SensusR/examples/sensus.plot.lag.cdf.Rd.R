library(SensusR)


### Name: sensus.plot.lag.cdf
### Title: Plot the CDF of inter-reading time lags.
### Aliases: sensus.plot.lag.cdf

### ** Examples

data.path = system.file("extdata", "example-data", package="SensusR")
data = sensus.read.json.files(data.path)
sensus.plot.lag.cdf(data$AccelerometerDatum)



