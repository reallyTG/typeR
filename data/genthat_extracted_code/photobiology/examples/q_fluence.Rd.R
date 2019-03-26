library(photobiology)


### Name: q_fluence
### Title: Photon fluence
### Aliases: q_fluence q_fluence.default q_fluence.source_spct
###   q_fluence.source_mspct

### ** Examples

library(lubridate)
q_fluence(sun.spct,
          w.band = waveband(c(400,700)),
          exposure.time = lubridate::duration(3, "minutes") )




