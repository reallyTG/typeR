library(photobiology)


### Name: fluence
### Title: Fluence
### Aliases: fluence fluence.default fluence.source_spct
###   fluence.source_mspct

### ** Examples

library(lubridate)
fluence(sun.spct,
        w.band = waveband(c(400,700)),
        exposure.time = lubridate::duration(3, "minutes") )




