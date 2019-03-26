library(photobiology)


### Name: split_irradiance
### Title: Energy or photon irradiance for split spectrum regions
### Aliases: split_irradiance

### ** Examples

with(sun.data,
      split_irradiance(w.length, s.e.irrad,
                       cut.w.length = c(300, 400, 500, 600, 700),
                       unit.out = "photon"))



