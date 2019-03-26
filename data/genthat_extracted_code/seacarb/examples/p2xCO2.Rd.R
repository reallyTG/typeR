library(seacarb)


### Name: p2xCO2
### Title: Converts partial pressure of CO2 to mole fraction of CO2
### Aliases: p2xCO2
### Keywords: utilities

### ** Examples

## Convert atmospheric pressure from mbar to atm
   Patm_mbar = 1052                 # in millibar
   Patm      = Patm_mbar / 1013.25  # in atm
## Compute xCO2 from pCO2
   pCO2 = 380
   xCO2 = p2xCO2(T=25, S=35, Patm=Patm, pCO2=pCO2)
   print(xCO2)
## The result is 377.1546 ppm 



