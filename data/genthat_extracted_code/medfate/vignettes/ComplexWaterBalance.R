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
control$transpirationMode = "Complex"
control$soilFunctions = "VG"

## ------------------------------------------------------------------------
x = spwbInput(above, below, examplesoil, SpParamsMED, control)

## ------------------------------------------------------------------------
x = forest2spwbInput(exampleforest, examplesoil, SpParamsMED, control)

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

## ---- fig=TRUE, fig.align="center", fig.width=7, fig.height = 7----------
par(mar=c(5,5,1,1), mfrow=c(2,2))
hydraulics.vulnerabilityCurvePlot(x, type="leaf")
hydraulics.vulnerabilityCurvePlot(x, type="stem")
hydraulics.vulnerabilityCurvePlot(x, type="root")
hydraulics.vulnerabilityCurvePlot(x, examplesoil, type="rhizo")

## ---- fig=TRUE, fig.align="center", fig.width=7, fig.height = 7----------
par(mar=c(5,5,1,1), mfrow=c(2,2))
hydraulics.supplyFunctionPlot(x, examplesoil, type="E")
hydraulics.supplyFunctionPlot(x, examplesoil, type="ERhizo")
hydraulics.supplyFunctionPlot(x, examplesoil, type="dEdP")
hydraulics.supplyFunctionPlot(x, examplesoil, type="psiStem")

## ---- fig=TRUE, fig.align="center", fig.width=7, fig.height = 17---------
d = 100
transp.stomatalRegulationPlot(x, examplesoil, examplemeteo, day = d, timestep=12,
                              latitude = 41.82592, elevation = 100)

## ------------------------------------------------------------------------
sd1<-spwb.day(x, examplesoil, rownames(examplemeteo)[d],  
             examplemeteo$MinTemperature[d], examplemeteo$MaxTemperature[d], 
             examplemeteo$MinRelativeHumidity[d], examplemeteo$MaxRelativeHumidity[d], 
             examplemeteo$Radiation[d], examplemeteo$WindSpeed[d], 
             latitude = 41.82592, elevation = 100, 
             slope= 0, aspect = 0, prec = examplemeteo$Precipitation[d])

## ------------------------------------------------------------------------
names(sd1)

## ------------------------------------------------------------------------
sd1$WaterBalance

## ------------------------------------------------------------------------
sd1$Soil

## ------------------------------------------------------------------------
names(sd1$EnergyBalance)

## ---- fig=TRUE, fig.align="center", fig.width=5, fig.height = 3.5--------
par(mar=c(4,4,1,1))
plot(sd1, type = "Temperature")

## ------------------------------------------------------------------------
names(sd1$Plants)

## ---- fig=TRUE, fig.align="center", fig.width=7.5, fig.height = 7.5------
par(mar=c(5,5,1,1), mfrow=c(2,2))
plot(sd1, type = "PlantTranspiration", bySpecies = T)
plot(sd1, type = "LeafTranspiration", bySpecies = T)
plot(sd1, type = "LeafPhotosynthesis", bySpecies = T)
plot(sd1, type = "LeafPsi", bySpecies = T)

## ---- fig=TRUE, fig.align="center", fig.width=7.5, fig.height = 4--------
plot(sd1, type = "LeafTemperature", bySpecies=TRUE)

## ---- fig=TRUE, fig.align="center", fig.width=7.5, fig.height = 4--------
plot(sd1, type = "LeafStomatalConductance", bySpecies=TRUE)

## ------------------------------------------------------------------------
examplesoil$W

## ------------------------------------------------------------------------
examplesoil$Temp

## ------------------------------------------------------------------------
x$canopy

## ------------------------------------------------------------------------
spwb.resetInputs(x, examplesoil)
examplesoil$W
examplesoil$Temp
x$canopy

## ------------------------------------------------------------------------
S = spwb(x, examplesoil, examplemeteo[110:170,], latitude = 41.82592, elevation = 100)

## ------------------------------------------------------------------------
class(S)

## ------------------------------------------------------------------------
names(S)

## ------------------------------------------------------------------------
names(S$spwbInput)

## ------------------------------------------------------------------------
head(S$WaterBalance)

## ------------------------------------------------------------------------
head(S$LeafPsi)

## ---- fig=TRUE, fig.align="center", fig.width=7, fig.height = 7----------
par(mar=c(5,5,1,1), mfrow=c(2,2))
plot(S, type="Evapotranspiration", bySpecies = TRUE)
plot(S, type="SoilPsi", bySpecies = TRUE)
plot(S, type="PlantTranspiration", bySpecies = TRUE)
plot(S, type="LeafPsiMin", bySpecies = TRUE)

## ------------------------------------------------------------------------
summary(S, freq="months",FUN=mean, output="Soil")

## ------------------------------------------------------------------------
summary(S, freq="months",FUN=mean, output="PlantStress")

## ------------------------------------------------------------------------
head(summary(S, freq="day", output="PlantStress", bySpecies = TRUE))

## ------------------------------------------------------------------------
summary(S, freq="month", FUN = mean, output="PlantStress", bySpecies = TRUE)

## ------------------------------------------------------------------------
spwb.resetInputs(x, examplesoil, from = S, day = 4)

## ------------------------------------------------------------------------
d = 144
sd1<-spwb.day(x, examplesoil, rownames(examplemeteo)[d], 
             examplemeteo$MinTemperature[d], examplemeteo$MaxTemperature[d], 
             examplemeteo$MinRelativeHumidity[d], 
             examplemeteo$MaxRelativeHumidity[d], 
             examplemeteo$Radiation[d], examplemeteo$WindSpeed[d], 
             latitude = 41.82592, elevation = 100, 
             slope= 0, aspect = 0, prec = examplemeteo$Precipitation[d])

## ---- fig=TRUE, fig.align="center", fig.width=7, fig.height = 7----------
par(mar=c(5,5,1,1), mfrow=c(2,2))
plot(sd1, type = "PlantTranspiration", bySpecies = T)
plot(sd1, type = "LeafTranspiration", bySpecies = T)
plot(sd1, type = "LeafPhotosynthesis", bySpecies = T)
plot(sd1, type = "LeafPsi", bySpecies = T)

