library(colorSpec)


### Name: actinometric
### Title: convert a colorSpec object to be actinometric
### Aliases: actinometric.colorSpec actinometric is.actinometric.colorSpec
###   is.actinometric
### Keywords: light

### ** Examples

colSums( solar.irradiance ) # step size is 1nm, from 280 to 1000 nm. organized as a matrix
# AirMass.0  GlobalTilt AirMass.1.5 
#  944.5458    740.3220    649.7749  # irradiance, watts*m^{-2}


colSums( actinometric(solar.irradiance) )
# AirMass.0  GlobalTilt AirMass.1.5 
#  4886.920    3947.761    3522.149  # photon irradiance, (umoles of photons)*sec^{-1}*m^{-2}

colSums( actinometric(solar.irradiance,multiplier=0.602214) )
# AirMass.0  GlobalTilt AirMass.1.5 
#  2942.972    2377.397    2121.088  # photon irradiance, exaphotons*sec^{-1}*m^{-2}




