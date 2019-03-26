library(SensusR)


### Name: sensus.remove.device.id
### Title: Removes all data associated with a device ID from a data
###   collection.
### Aliases: sensus.remove.device.id

### ** Examples

data.path = system.file("extdata", "example-data", package="SensusR")
data = sensus.read.json.files(data.path)
filtered.data = sensus.remove.device.id(data$AccelerometerDatum, "a448s0df98f")



