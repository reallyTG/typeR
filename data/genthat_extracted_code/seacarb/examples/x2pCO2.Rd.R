library(seacarb)


### Name: x2pCO2
### Title: Converts mole fraction to partial pressure of CO2
### Aliases: x2pCO2
### Keywords: utilities

### ** Examples

## Atmospheric pressure is rarely equal to 1 atm exactly 
## Over the Southern Ocean Patm=0.97 is more realistic
   pCO2_socn <- x2pCO2(S=35, T=0, Patm=0.97, xCO2=400.0)
   print(pCO2_socn)
## The result (385.6322 uatm) is 12 uatm less than if it was wrongly assumed that Patm=1.0

## Show effect of temperature on pCO2 computed from xCO2, and on resulting variables from "carb"
S <- 35
ALK <- 2300e-6
T <- seq(0,30,5)
xCO2 <- 400
pCO2 <- x2pCO2(S=35, T=T, Patm=1, xCO2=400)
results <- carb(flag=24, var1=pCO2, var2=ALK, S=S, T=T, P=0, Pt=0, Sit=0, 
  pHscale="T", kf="pf", k1k2="l", ks="d", b="u74")
print(results)




