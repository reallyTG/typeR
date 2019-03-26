library(seacarb)


### Name: speciation
### Title: ionic forms as a function of pH
### Aliases: speciation
### Keywords: utilities

### ** Examples

## Speciation of divalent species; example to estimate the various ionic forms
## of dissolved inorganic carbon  (DIC = 0.0021 mol/kg) at a salinity of 35,
## a temperature of 25oC and an hydrostatic pressure of 0:
spec <- speciation (K1(35, 25, 0), K2(35, 25, 0), pH=8, conc=0.0021)
## where (spec\$C1=[CO2], spec\$C2=[HCO3-], spec\$C3=[CO3--])

## Speciation of trivalent species (e.g.,  H3PO4, H2PO4-, HPO4--, PO4---)
speciation(K1p(), K2p(), K3p(), conc=0.001)

## Effect of temperature on pCO2 - Figure 1.4.18 of Zeebe and Wolf-Gladrow (2001)
Tseq <- seq(0, 30, by=0.5)
pHseq <- carb(flag=15, var1=2300e-6, var2=1900e-6, S=35, T=Tseq, P=0)$pH
CO2  <- speciation(K1(T=Tseq), K2(T=Tseq), conc=1900, pH=pHseq)$C1
pCO2 <- CO2/K0(T=Tseq)
plot(Tseq, pCO2, xlab="Temperature (oC)", ylab="pCO2 (uatm)", type="l", 
	main="effect of temperature on pCO2")
legend("topleft", c(expression(sum(CO[2])==1900~umol~kg^"-1"), 
	expression(TA==2300~umol~kg^"-1")))



