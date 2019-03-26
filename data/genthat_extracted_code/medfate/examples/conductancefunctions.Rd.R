library(medfate)


### Encoding: UTF-8

### Name: conductancefunctions
### Title: Hydraulic confuctance functions
### Aliases: hydraulics.psi2K hydraulics.K2Psi hydraulics.averagePsi
###   hydraulics.psiCrit hydraulics.vulnerabilityCurvePlot
###   hydraulics.vanGenuchtenConductance hydraulics.xylemConductance
###   hydraulics.xylemPsi hydraulics.psi2Weibull

### ** Examples

kstemmax = 4 # in mmol·m-2·s-1·MPa-1
stemc = 3 
stemd = -4 # in MPa

psiVec = seq(-0.1, -7.0, by =-0.01)

#Vulnerability curve
kstem = unlist(lapply(psiVec, hydraulics.xylemConductance, kstemmax, stemc, stemd))
plot(-psiVec, kstem, type="l",ylab="Xylem conductance (mmol·m-2·s-1·MPa-1)", 
xlab="Canopy pressure (-MPa)", lwd=1.5,ylim=c(0,kstemmax))



