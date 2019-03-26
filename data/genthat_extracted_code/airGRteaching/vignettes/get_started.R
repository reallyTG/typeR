## ----include=FALSE-------------------------------------------------------
formatGR <- '<strong><font color="#009EE0">%s</font></strong>'
GR            <- sprintf(formatGR, "GR")
airGR         <- sprintf(formatGR, "airGR")
airGRteaching <- sprintf(formatGR, "airGRteaching")

## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)
library(airGRteaching)

## ---- echo=3, eval=TRUE--------------------------------------------------
data(L0123001)
BasinObs <- BasinObs[, c("DatesR", "P", "E", "Qmm", "T")]
head(BasinObs)

## ---- echo=TRUE, eval=TRUE-----------------------------------------------
PREP <- PrepGR(ObsDF = BasinObs, HydroModel = "GR5J", CemaNeige = FALSE)

## ---- warning=FALSE------------------------------------------------------
CAL <- CalGR(PrepGR = PREP, CalCrit = "KGE2",
             WupPer = NULL, CalPer = c("1990-01-01", "1993-12-31"))

## ---- warning=FALSE------------------------------------------------------
SIM <- SimGR(PrepGR = PREP, CalGR = CAL, EffCrit = "KGE2",
             WupPer = NULL, SimPer = c("1994-01-01", "1998-12-31"))

## ---- fig.width=7*1.5, fig.height=4.25*1.5, dev.args=list(pointsize=14), echo=-1----
par(cex.lab = 0.6, cex.axis = 0.6)
plot(PREP, main = "Observation")

## ---- echo=TRUE, eval=FALSE----------------------------------------------
#  plot(CAL, which = "perf")

## ---- fig.width=7*1.5, fig.height=4.25*1.5, dev.args=list(pointsize=14), echo=FALSE, warning=FALSE----
plot(CAL, which = "perf", cex.lab = 0.7, cex.axis = 0.7)

## ---- fig.width=7*1.5, fig.height=3.25*1.5, dev.args=list(pointsize=14)----
plot(CAL, which = "iter")

## ---- fig.width=7*1.5, fig.height=4.25*1.5, dev.args=list(pointsize=14), echo=-1----
par(cex.lab = 0.7, cex.axis = 0.7)
plot(CAL, which = "ts", main = "Calibration")

## ---- eval=FALSE---------------------------------------------------------
#  plot(SIM)

## ---- eval=FALSE---------------------------------------------------------
#  dyplot(SIM, main = "Simulation")

## ---- eval=FALSE---------------------------------------------------------
#  ShinyGR(ObsDF = BasinObs, SimPer = c("1994-01-01", "1998-12-31"))

