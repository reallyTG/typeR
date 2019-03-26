library(Thermimage)


### Name: airdensity
### Title: Returns the density of air for a given air temperature.
### Aliases: airdensity

### ** Examples


## The function is currently defined as
function (Ta = 20) 
{
    Base <- 314.156
    Exponent <- (-0.981)
    p <- Base * (Ta + 273.15)^Exponent
    p
  }



