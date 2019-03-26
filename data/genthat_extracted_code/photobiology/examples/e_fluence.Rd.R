library(photobiology)


### Name: e_fluence
### Title: Energy fluence
### Aliases: e_fluence e_fluence.default e_fluence.source_spct
###   e_fluence.source_mspct

### ** Examples

library(lubridate)
e_fluence(sun.spct, w.band = waveband(c(400,700)),
          exposure.time = lubridate::duration(3, "minutes") )




