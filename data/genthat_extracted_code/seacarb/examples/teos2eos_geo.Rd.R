library(seacarb)


### Name: teos2eos_geo
### Title: Convert temperature and salinity from TEOS-10 to EOS-80
### Aliases: teos2eos_geo
### Keywords: utilities

### ** Examples

   # Calculate in situ temperature and practical salinity of a sample with 
   # Absolute salinity of 35 g/kg, conservative temperature of 18 deg C,
   # depth is 10 dbar and location is 188 degrees East and 4 degrees North.
   f <- teos2eos_geo(SA=35, CT=18, P=10, long=188, lat=4)
   T <- f$T     # in situ temperature
   SP <- f$SP     # Practical salinity



