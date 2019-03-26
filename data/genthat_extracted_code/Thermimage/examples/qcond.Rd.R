library(Thermimage)


### Name: qcond
### Title: Estimates the area specific heat transfer by conduction (W/m2)
### Aliases: qcond

### ** Examples

## The function is currently defined as
function (Ts = 30, Tc = 20, ktiss = 0.502, x = 1) 
{
    qcond <- ktiss * (Tc - Ts)/x
    qcond
  }



