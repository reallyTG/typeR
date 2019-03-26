library(EcoHydRology)


### Name: SatVapPresSlope
### Title: Slope of the relationship between Saturation Vapor Pressure and
###   Temperature
### Aliases: SatVapPresSlope

### ** Examples


## The function is currently defined as
function (temp_C) 
{
    (2508.3/(temp_C + 237.3)^2) * exp(17.3 * temp_C/(temp_C + 
        237.3))
  }



