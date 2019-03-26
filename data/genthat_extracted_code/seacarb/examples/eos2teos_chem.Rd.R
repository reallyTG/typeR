library(seacarb)


### Name: eos2teos_chem
### Title: Convert temperature and salinity from EOS-80 to TEOS-10
### Aliases: eos2teos_chem
### Keywords: utilities

### ** Examples

   # Calculate Conservative Temperature and Absolute Salinity of a sample with 
   # Practical salinity of 35 psu, in-situ temperature of 18 deg C,
   # at 0 dbar and total alkalinity of 0.00234 mol/kg and DIC of 0.00202 mol/kg
   f <- eos2teos_chem(SP=35, T=18, P=0, TA=0.00234, DIC=0.00202)
   CT <- f$CT     # Conservative Temperature
   SA <- f$SA     # Absolute Salinity



