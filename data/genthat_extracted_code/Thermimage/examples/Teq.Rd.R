library(Thermimage)


### Name: Teq
### Title: Estimates equivalent temperature.
### Aliases: Teq

### ** Examples

## The function is currently defined as
function (Ts = 30, Ta = 25, Tg = NULL, RH = 0.5, E = 0.96, rho = 0.1, 
    cloud = 0, SE = 0, V = 1, L = 0.1, type = "forced") 
{
    if (type == "forced") 
        k <- 0.7 * 310
    if (type == "free") 
        k <- 310
    rr <- airdensity(Ta) * airspecificheat(Ta)/(4 * E * StephBoltz() * 
        (Ta + 273.15)^3)
    ra <- k * (L/V)^0.5
    re <- 1/(1/ra + 1/rr)
    Rni <- qabs(Ta = Ta, Tg = Tg, RH = RH, E = E, rho = rho, 
        cloud = cloud, SE = SE) - StephBoltz() * E * (Ta + 273.15)^4
    Teq <- Ta + Rni * re/(airdensity(Ta) * airspecificheat(Ta))
    Teq
  }
  
# For detailed examples and explanations, see:
# https://github.com/gtatters/Thermimage/blob/master/HeatTransferCalculations.md




