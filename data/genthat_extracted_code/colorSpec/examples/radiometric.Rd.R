library(colorSpec)


### Name: radiometric
### Title: convert a colorSpec object from actinometric to radiometric
### Aliases: radiometric radiometric.colorSpec is.radiometric
###   is.radiometric.colorSpec
### Keywords: light

### ** Examples

sum( F96T12 )    # the step size is 1nm, from 300 to 900nm
# [1] 320.1132  photon irradiance, (micromoles of photons)*m^{-2}*sec^{-1}

sum( radiometric(F96T12) )
# [1] 68.91819  irradiance, watts*m^{-2}



