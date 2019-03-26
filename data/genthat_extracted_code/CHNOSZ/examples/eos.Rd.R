library(CHNOSZ)


### Name: eos
### Title: Equations of State
### Aliases: eos hkf cgl

### ** Examples

## Don't show: 
data(thermo)
## End(Don't show)
## aqueous species
CH4aq <- info(info("methane", "aq"))	
hkf(property = "Cp", parameters = CH4aq)
# the non-solvation heat capacity
hkf(property = "Cp", parameters = CH4aq, contrib = "n")	
# at different temperature and pressure
hkf(property = "Cp", parameters = CH4aq, T = c(373.15,473.15), P = 1000)

## crystalline, gas, liquid species
CH4gas <- info(info("methane", "gas"))	
cgl(property = "Cp", parameters = CH4gas)
# melting and vaporization of n-octane
C8H18par <- info(info(rep("n-octane", 3), c("cr", "liq", "gas")))
myT <- seq(200, 420, 10)
DG0f <- cgl(property = "G", parameters = C8H18par, T = myT, P = 1)
cbind(T = myT, which.pmax(DG0f, pmin = TRUE))  # 1 = cr, 2 = liq, 3 = gas
# compare that result with the tabulated transition temperatures
print(C8H18par)



