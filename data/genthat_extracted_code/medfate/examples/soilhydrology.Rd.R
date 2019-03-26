library(medfate)


### Name: hydrology.soilInfiltration
### Title: Soil infiltration and bare soil evaporation
### Aliases: hydrology.soilInfiltration hydrology.soilEvaporation
###   hydrology.infiltrationRepartition

### ** Examples

SoilDepth = c(200,400,800,1200,1500)

#TOPSOIL LAYERS
d1 = pmin(SoilDepth, 300) #<300
#SUBSOIL LAYERS
d2 = pmax(0, pmin(SoilDepth-300,1200)) #300-1500 mm
#ROCK LAYER
d3 = 4000-(d1+d2) #From SoilDepth down to 4.0 m

TS_clay = 15
TS_sand = 25
SS_clay = 15
SS_sand = 25
RL_clay = 15
RL_sand = 25
TS_gravel = 20
SS_gravel = 40
RL_gravel = 95

Theta_FC1=soil.psi2thetaSX(TS_clay, TS_sand, -33) #in m3/m3
Theta_FC2=soil.psi2thetaSX(SS_clay, SS_sand, -33) #in m3/m3
Theta_FC3=soil.psi2thetaSX(RL_clay, RL_sand, -33) #in m3/m3
pcTS_gravel = 1-(TS_gravel/100)
pcSS_gravel = 1-(SS_gravel/100)
pcRL_gravel = 1-(RL_gravel/100)
MaxVol1 = (d1*Theta_FC1*pcTS_gravel)
MaxVol2 = (d2*Theta_FC2*pcSS_gravel)
MaxVol3 = (d3*Theta_FC3*pcRL_gravel)
V = MaxVol1+MaxVol2+MaxVol3

par(mar=c(5,5,1,1), mfrow=c(1,2))
NP = seq(0,60, by=1)
plot(NP,hydrology.soilInfiltration(NP, V[1]), type="l", xlim=c(0,60), ylim=c(0,60), 
     ylab="Infiltration (mm)", xlab="Net rainfall (mm)", frame=FALSE)
lines(NP,hydrology.soilInfiltration(NP, V[2]), lty=2)
lines(NP,hydrology.soilInfiltration(NP, V[3]), lty=3)
lines(NP,hydrology.soilInfiltration(NP, V[4]), lty=4)
lines(NP,hydrology.soilInfiltration(NP, V[5]), lty=5)
legend("topleft", bty="n", lty=1:5, 
       legend=c(paste("d =", SoilDepth, "Vsoil =",round(V),"mm")))
plot(NP,NP-hydrology.soilInfiltration(NP, V[1]), type="l", xlim=c(0,60), ylim=c(0,60), 
     ylab="Runoff (mm)", xlab="Net rainfall (mm)", frame=FALSE)
lines(NP,NP-hydrology.soilInfiltration(NP, V[2]), lty=2)
lines(NP,NP-hydrology.soilInfiltration(NP, V[3]), lty=3)
lines(NP,NP-hydrology.soilInfiltration(NP, V[4]), lty=4)
lines(NP,NP-hydrology.soilInfiltration(NP, V[5]), lty=5)
legend("topleft", bty="n", lty=1:5, 
       legend=c(paste("d =", SoilDepth,"Vsoil =",round(V),"mm")))





