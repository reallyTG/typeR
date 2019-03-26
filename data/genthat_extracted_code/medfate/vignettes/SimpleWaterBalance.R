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
print(examplesoil, model = "SX")

## ------------------------------------------------------------------------
print(examplesoil, model="VG")

## ---- fig = TRUE, fig.width= 5, fig.height=4, fig.align= 'center', echo=TRUE----
par(mar=c(4,4,1,1))
# Plot Saxton's retention curve
psi = seq(-0.001, -2.0, by=-0.001)
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
control

## ------------------------------------------------------------------------
x = spwbInput(above, below, examplesoil, SpParamsMED, control)

## ------------------------------------------------------------------------
x

## ------------------------------------------------------------------------
x = forest2spwbInput(exampleforest, examplesoil, SpParamsMED, control)

## ------------------------------------------------------------------------
d = 100
sd1<-spwb.day(x, examplesoil, rownames(examplemeteo)[d],  
             examplemeteo$MinTemperature[d], examplemeteo$MaxTemperature[d], 
             examplemeteo$MinRelativeHumidity[d], examplemeteo$MaxRelativeHumidity[d], 
             examplemeteo$Radiation[d], examplemeteo$WindSpeed[d], 
             latitude = 41.82592, elevation = 100, 
             slope= 0, aspect = 0, prec = examplemeteo$Precipitation[d])

## ------------------------------------------------------------------------
names(sd1)

## ------------------------------------------------------------------------
sd1

## ------------------------------------------------------------------------
examplesoil$W
x$canopy$gdd

## ------------------------------------------------------------------------
spwb.resetInputs(x, examplesoil)
examplesoil$W
x$canopy$gdd

## ------------------------------------------------------------------------
S = spwb(x, examplesoil, examplemeteo, elevation = 100)

## ------------------------------------------------------------------------
class(S)

## ------------------------------------------------------------------------
names(S)

## ------------------------------------------------------------------------
names(S$spwbInput)

## ------------------------------------------------------------------------
head(S$WaterBalance)

## ------------------------------------------------------------------------
head(S$PlantPsi)

## ---- fig=TRUE, fig.align="center", fig.width=5, fig.height = 4----------
par(mar=c(5,5,1,1))
plot(S, type = "PET_Precipitation")

## ---- fig=TRUE, fig.align="center", fig.width=5, fig.height = 4----------
par(mar=c(5,5,1,1))
plot(S, type = "Snow")

## ---- fig=TRUE, fig.align="center", fig.width=5, fig.height = 4----------
par(mar=c(5,5,1,1))
plot(S, type="SoilTheta")

## ---- fig=TRUE, fig.align="center", fig.width=5, fig.height = 4----------
par(mar=c(5,5,1,1))
plot(S, type="SoilPsi")

## ---- fig=TRUE, fig.align="center", fig.width=5, fig.height = 4----------
par(mar=c(5,5,1,1))
plot(S, type="PlantTranspiration")

## ------------------------------------------------------------------------
summary(S, freq="months",FUN=mean, output="Soil")

## ------------------------------------------------------------------------
summary(S, freq="months",FUN=mean, output="PlantStress")

## ------------------------------------------------------------------------
head(summary(S, freq="day", output="PlantStress", bySpecies = TRUE))

## ------------------------------------------------------------------------
summary(S, freq="month", FUN = mean, output="PlantStress", bySpecies = TRUE)

## ------------------------------------------------------------------------
x$control$cavitationRefill = FALSE
x$control$verbose = FALSE

## ------------------------------------------------------------------------
spwb.resetInputs(x, examplesoil)
Snr = spwb(x, examplesoil, examplemeteo, elevation=100) 

## ---- fig=TRUE, fig.align="center", fig.width=8, fig.height = 4----------
par(mar=c(5,5,1,1), mfrow=c(1,2))
plot(Snr, type="PlantStress")
plot(Snr, type="PlantTranspiration")

## ------------------------------------------------------------------------
data("exampleSPL")
plot(exampleSPL)

## ------------------------------------------------------------------------
data("examplemeteo")
data("SpParamsMED")
control = defaultControl()
control$verbose = FALSE

## ------------------------------------------------------------------------
res <- spwbpoints(exampleSPL, SpParamsMED, examplemeteo, control = control)

## ------------------------------------------------------------------------
names(res)

## ------------------------------------------------------------------------
summary(res$result$`80013`, freq="months",FUN=sum, 
        output="PlantTranspiration", bySpecies = TRUE)

