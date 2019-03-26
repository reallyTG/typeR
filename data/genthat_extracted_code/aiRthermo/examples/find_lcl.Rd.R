library(aiRthermo)


### Name: find_lcl
### Title: Calculation of the Lifted Condensation Level (LCL)
### Aliases: find_lcl
### Keywords: Functions

### ** Examples

Ptop=50000
P0=101325
T0=273.15
w0=0.0025
deltaP=5
rh=100*w0/saturation_mixing_ratio(P0,T0,export_constants())
fndlcl=find_lcl(Ptop,P0,T0,w0,deltaP)



