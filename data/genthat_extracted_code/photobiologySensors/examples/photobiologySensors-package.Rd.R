library(photobiologySensors)


### Name: photobiologySensors-package
### Title: photobiologySensors: Spectral Response Data for Light Sensors
### Aliases: photobiologySensors photobiologySensors-package

### ** Examples

library(photobiology)
library(photobiologyWavebands)
library(ggspectra)

names(sensors.mspct)

licor_sensors
par_sensors
intersect(par_sensors, licor_sensors)

photon_as_default()

response(sensors.mspct$LI_190, w.band = PAR(), quantity = "contribution.pc")

plot(sensors.mspct$LI_190, w.band = PAR(), label.qty = "contribution.pc")




