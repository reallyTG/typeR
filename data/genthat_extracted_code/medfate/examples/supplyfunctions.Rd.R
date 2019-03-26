library(medfate)


### Encoding: UTF-8

### Name: supplyfunctions
### Title: Hydraulic supply functions
### Aliases: hydraulics.ECrit hydraulics.EXylem hydraulics.EVanGenuchten
###   hydraulics.ECapacitance hydraulics.E2psiXylem
###   hydraulics.E2psiVanGenuchten hydraulics.E2psiTwoElements
###   hydraulics.E2psiBelowground hydraulics.E2psiAboveground
###   hydraulics.E2psiAbovegroundCapacitance
###   hydraulics.E2psiAbovegroundCapacitanceDisconnected
###   hydraulics.E2psiNetwork hydraulics.E2psiNetworkCapacitance
###   hydraulics.supplyFunctionOneXylem
###   hydraulics.supplyFunctionTwoElements
###   hydraulics.supplyFunctionThreeElements
###   hydraulics.supplyFunctionBelowground
###   hydraulics.supplyFunctionAboveground
###   hydraulics.supplyFunctionAbovegroundCapacitance
###   hydraulics.supplyFunctionNetwork
###   hydraulics.supplyFunctionNetworkCapacitance
###   hydraulics.supplyFunctionPlot hydraulics.regulatedPsiXylem
###   hydraulics.regulatedPsiTwoElements

### ** Examples

kstemmax = 4 # in mmol·m-2·s-1·MPa-1
stemc = 3 
stemd = -4 # in MPa

psiVec = seq(-0.1, -7.0, by =-0.01)

#Vulnerability curve
kstem = unlist(lapply(psiVec, hydraulics.xylemConductance, kstemmax, stemc, stemd))
plot(-psiVec, kstem, type="l",ylab="Xylem conductance (mmol·m-2·s-1·MPa-1)", 
xlab="Canopy pressure (-MPa)", lwd=1.5,ylim=c(0,kstemmax))



