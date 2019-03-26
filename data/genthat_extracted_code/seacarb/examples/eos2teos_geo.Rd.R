library(seacarb)


### Name: eos2teos_geo
### Title: Convert temperature and salinity from EOS-80 to TEOS-10
### Aliases: eos2teos_geo
### Keywords: utilities

### ** Examples

   # Calculate conservative temperature and absolute salinity of a sample with 
   # Practical salinity of 35 psu, in situ temperature of 18 deg C,
   # depth is 10 dbar and location is 188 degrees East and 4 degrees North.
   f <- eos2teos_geo(SP=35, T=18, P=10, long=188, lat=4)
   CT <- f$CT     # Conservative temperature
   SA <- f$SA     # Absolute salinity



