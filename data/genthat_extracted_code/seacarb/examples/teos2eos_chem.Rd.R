library(seacarb)


### Name: teos2eos_chem
### Title: Convert temperature and salinity from TEOS-10 to EOS-80
### Aliases: teos2eos_chem
### Keywords: utilities

### ** Examples

   # Calculate in situ temperature and practical salinity of a sample with 
   # Absolute salinity of 35 g/kg, Conservative temperature of 18 deg C,
   # at 0 dbar and Total alkalinity of 0.00234 mol/kg and DIC of 0.00202 mol/kg
   f <- teos2eos_chem(SA=35, CT=18, P=0, TA=0.00234, DIC=0.00202)
   T <- f$T     # insitu temperature
   SP <- f$SP     # Practical salinity



