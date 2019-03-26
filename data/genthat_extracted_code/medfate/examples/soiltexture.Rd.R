library(medfate)


### Name: soil texture and hydraulics
### Title: Soil texture and hydraulics
### Aliases: soil.psi2thetaSX soil.psi2thetaVG soil.psi soil.theta2psiSX
###   soil.theta2psiVG soil.thetaFC soil.thetaWP soil.thetaSAT
###   soil.thetaSATSX soil.theta soil.waterFC soil.waterWP soil.waterSAT
###   soil.USDAType soil.vanGenuchtenParamsCarsel
###   soil.vanGenuchtenParamsToth soil.waterTableDepth

### ** Examples


# Plot Saxton's water retention curve
psi = seq(0, -6.0, by=-0.01)
plot(-psi, lapply(as.list(psi), FUN=soil.psi2thetaSX, clay=40, sand=10, om = 1), 
     type="l", ylim=c(0,0.6),ylab="Water content (prop. volume)", 
     xlab = "Soil water potential (-MPa)")

#Determine USDA soil texture type
type = soil.USDAType(clay=40, sand=10)
type

#Van Genuchten's params (bulk density = 1.3 g/cm)
vg = soil.vanGenuchtenParamsToth(40,10,1,1.3,TRUE)
vg

#Add Van Genuchten water retention curve 
lines(-psi, lapply(as.list(psi), FUN=soil.psi2thetaVG, alpha=vg[1], n = vg[2], 
      theta_res = vg[3], theta_sat = vg[4]), lty=2) 

legend("topright", legend=c("Saxton", "Van Genuchten"), lty=c(1,2), bty="n")



