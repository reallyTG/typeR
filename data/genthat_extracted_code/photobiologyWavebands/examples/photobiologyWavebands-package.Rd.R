library(photobiologyWavebands)


### Name: photobiologyWavebands-package
### Title: photobiologyWavebands: Waveband Definitions for UV, VIS, and IR
###   Radiation
### Aliases: photobiologyWavebands photobiologyWavebands-package

### ** Examples


q_irrad(sun.spct, PAR())  # PAR photon irradiance
q_irrad(sun.spct, Blue("ISO")) # blue photon irradiance, ISO definition
q_irrad(sun.spct, Blue("Sellaro")) # blue photon irradiance, Sellaro et al.'s definition
e_irrad(sun.spct, VIS()) # VIS irradiance, ISO definition
q_irrad(sun.spct, VIS()) # VIS photon, ISO definition



