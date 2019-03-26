## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)
library(medfate)

## ------------------------------------------------------------------------
spar = defaultSoilParams(2)
print(spar)

## ------------------------------------------------------------------------
examplesoil = soil(spar, VG_PTF = "Toth")
names(examplesoil)

## ------------------------------------------------------------------------
examplesoil$W

## ------------------------------------------------------------------------
examplesoil$Temp

## ------------------------------------------------------------------------
print(examplesoil, model = "SX")

## ------------------------------------------------------------------------
print(examplesoil, model="VG")

## ---- fig = TRUE, fig.width= 5, fig.height=4, fig.align= 'center', echo=TRUE----
par(mar=c(4,4,1,1))
# Plot Saxton's retention curve
psi = seq(-0.01, -2.0, by=-0.001)
plot(-psi, lapply(as.list(psi), FUN=soil.psi2thetaSX, clay=25, sand=25), 
     type="l", ylim=c(0,0.5),ylab="Water content (prop. volume)", xlab = "Soil water potential (-MPa)")

#Add Van Genuchten retention curve
lines(-psi, lapply(as.list(psi), FUN=soil.psi2thetaVG, 
      alpha=examplesoil$VG_alpha[1], n = examplesoil$VG_n[1], 
      theta_res = examplesoil$VG_theta_res[1], 
      theta_sat = examplesoil$VG_theta_sat[1]), lty=2) 

legend("topright", legend=c("Saxton", "Van Genuchten"), lty=c(1,2), bty="n")


## ------------------------------------------------------------------------
data("SpParamsMED")

## ------------------------------------------------------------------------
names(SpParamsMED)

## ------------------------------------------------------------------------
data(exampleforest)
exampleforest

## ------------------------------------------------------------------------
above = forest2aboveground(exampleforest, SpParamsMED)
above

## ------------------------------------------------------------------------
Z = c(exampleforest$treeData$Z95, exampleforest$shrubData$Z)
Z
below = forest2belowground(exampleforest, examplesoil, SpParamsMED)
below

## ------------------------------------------------------------------------
root.ldrDistribution(exampleforest$treeData$Z50[1], 
                     exampleforest$treeData$Z95[1],
                     examplesoil$dVec)

## ------------------------------------------------------------------------
data(examplemeteo)
head(examplemeteo)

## ------------------------------------------------------------------------
control = defaultControl()

## ------------------------------------------------------------------------
names(control)

## ------------------------------------------------------------------------
control$storagePool = "two"

## ------------------------------------------------------------------------
x = growthInput(above, Z, below, examplesoil, SpParamsMED, control)

## ------------------------------------------------------------------------
x = forest2growthInput(exampleforest, examplesoil, SpParamsMED, control)

## ------------------------------------------------------------------------
names(x)

## ------------------------------------------------------------------------
x$cohorts

## ------------------------------------------------------------------------
x$canopy

## ------------------------------------------------------------------------
x$above

## ------------------------------------------------------------------------
x$paramsTransp

## ------------------------------------------------------------------------
x$below

## ------------------------------------------------------------------------
x$paramsGrowth
x$paramsAllometries

## ------------------------------------------------------------------------
G1<-growth(x, examplesoil, examplemeteo, elevation = 100)


## ---- fig=TRUE, echo=FALSE, fig.width=7.5, fig.height=4------------------
par(mar=c(4,4,1,4), mfrow=c(1,2))
plot(G1, "PlantPhotosynthesis")
plot(G1, "PlantTranspiration")

## ---- fig=TRUE, echo=FALSE, fig.width=7.5, fig.height=7------------------

dates = as.Date(row.names(examplemeteo))
par(mar=c(4,4,1,1), mfrow=c(2,2))
plot(dates,G1$PlantPhotosynthesis[,1], type="l", xlab="",ylab="Photosynthesis per area (gC/m2)")
lines(dates, G1$PlantPhotosynthesis[,2], lty=2)

x1 = (G1$PlantPhotosynthesis[,1])/(x$above$N[1]/10000)#/G1$PlantLAIlive[,2]
x2 = (G1$PlantPhotosynthesis[,2])/(x$above$N[2]/10000)#/G1$PlantLAIlive[,2]
plot(dates,x1, type="l", xlab="",ylab="Photosynthesis per ind. (gC/ind)")
lines(dates, x2, lty=2)
abline(h=0, col="gray")

plot(dates,G1$PlantTranspiration[,1], type="l", xlab="",ylab="Transpiration per area (mm/m2)")
lines(dates, G1$PlantTranspiration[,2], lty=2)
abline(h=0, col="gray")

x1 = (G1$PlantTranspiration[,1])/(x$above$N[1]/10000)
x2 = (G1$PlantTranspiration[,2])/(x$above$N[2]/10000)
plot(dates,x1, type="l", xlab="",ylab="Transpiration per ind. (mm/ind)")
lines(dates, x2, lty=2)
abline(h=0, col="gray")

## ---- fig=TRUE, echo=FALSE, fig.width=7.5, fig.height=7------------------
par(mar=c(4,4,1,4), mfrow=c(2,2))
plot(dates,G1$PlantRespiration[,1], type="l", xlab="",ylab="Respiration per ground area (gC/m2)", ylim=c(0,2))
lines(dates, G1$PlantRespiration[,2], lty=2)

x1 = (G1$PlantRespiration[,1])/(x$above$N[1]/10000)#/G1$PlantLAIlive[,2]
x2 = (G1$PlantRespiration[,2])/(x$above$N[2]/10000)#/G1$PlantLAIlive[,2]
plot(dates,x1, type="l", xlab="",ylab="Respiration per individual (gC/ind)", ylim=c(0,35))
lines(dates, x2, lty=2)
abline(h=0, col="gray")

plot(dates,G1$PlantPhotosynthesis[,1]-G1$PlantRespiration[,1], type="l", xlab="",ylab="Photosynthesis-Respiration per ground area (gC/m2)", ylim=c(-1,7))
lines(dates, G1$PlantPhotosynthesis[,2]-G1$PlantRespiration[,2], lty=2)
abline(h=0, col="gray")

x1 = (G1$PlantPhotosynthesis[,1]-G1$PlantRespiration[,1])/(x$above$N[1]/10000)
x2 = (G1$PlantPhotosynthesis[,2]-G1$PlantRespiration[,2])/(x$above$N[2]/10000)
plot(dates,x1, type="l", xlab="",ylab="Photosynthesis-Respiration per individual (gC/ind)")
lines(dates, x2, lty=2)
abline(h=0, col="gray")

## ---- fig=TRUE, echo=FALSE, fig.width=5, fig.height=4--------------------
par(mar=c(4,4,1,4))
plot(dates,100*G1$PlantSAgrowth[,1]/G1$PlantSA[,1], type="l", xlab="",ylab="Relative growth rate (cm2·cm-2)")
lines(dates,100*G1$PlantSAgrowth[,2]/G1$PlantSA[,2],lty=2)
# axis(4, at=c(0,4,8,12), labels=c(0,1,2,3))
# mtext("Transpiration (mm)", 4, line=2)
legend("topleft", lty=c(1,2), legend = c("Tree individuals","Shrub individuals"), bty="n")

## ---- fig=TRUE, echo=FALSE, fig.width=5, fig.height=4--------------------
par(mar=c(4,4,1,4))
plot(dates,G1$PlantLAIlive[,1], type="l", xlab="",ylab="Live leaf area index (m2·m-2)", ylim=c(0,2.5))
lines(dates,G1$PlantLAIlive[,2],lty=2)
legend("topleft", lty=c(1,2), legend = c("Tree individuals","Shrub individuals"), bty="n")

## ---- fig=TRUE, echo=FALSE, fig.width=7.5, fig.height=3.5----------------
par(mar=c(4,4,1,4), mfrow=c(1,2))
plot(dates,100*G1$PlantCstorageFast[,1], type="l", ylab="Fast C pool (%)", xlab="", ylim=c(0,100))
lines(dates,100*G1$PlantCstorageFast[,2], lty=2)
legend("bottomleft", lty=c(1,2), legend = c("Tree individuals","Shrub individuals"), bty="n")
plot(dates,100*G1$PlantCstorageSlow[,1], type="l", ylab="Slow C pool (%)", xlab="", ylim=c(0,100))
lines(dates,100*G1$PlantCstorageSlow[,2], lty=2)
legend("bottomleft", lty=c(1,2), legend = c("Tree individuals","Shrub individuals"), bty="n")


