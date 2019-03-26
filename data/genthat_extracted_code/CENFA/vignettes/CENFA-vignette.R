## ---- echo = FALSE, message=FALSE----------------------------------------
knitr::opts_chunk$set(
  comment = "#>",
  fig.align = 'center',
  fig.width = 6,
  fig.height = 4
)
# library(raster)
# library(sp)
library(CENFA)

## ----QUGA-plot, echo=FALSE-----------------------------------------------
par(mar = c(1, 1, 1, 1))
plot(QUGA, col = "darkgreen", main = "Oregon white oak distribution")
plot(climdat.hist[["PWQ"]] / 10, add = T, 
     legend.lab = "Precip of wettest quarter (cm)", smallplot = c(.7, .71, .3, .7))
plot(QUGA, add = T, col = "darkgreen")

## ----enfa----------------------------------------------------------------
mod.enfa <- enfa(x = climdat.hist, s.dat = QUGA, field = "CODE")
mod.enfa

## ----"scatter"-----------------------------------------------------------
glc <- GLcenfa(x = climdat.hist)
scatter(x = mod.enfa, y = glc)

## ----example-big, eval=FALSE---------------------------------------------
#  # does not enable parallelization
#  mod <- enfa(x = climdat.hist, s.dat = QUGA, field = "CODE", parallel = TRUE)
#  
#  # enables parallelization across 4 cores
#  mod <- enfa(x = climdat.hist, s.dat = QUGA, field = "CODE", parallel = TRUE, n = 4)

## ----cnfa----------------------------------------------------------------
mod.cnfa <- cnfa(x = climdat.hist, s.dat = QUGA, field = "CODE")
mod.cnfa

## ----"sensitivity-map", echo=1-------------------------------------------
s.map <- sensitivity_map(mod.cnfa)

par(mar = c(1, 1, 1, 1))
plot(QUGA, col = "darkgreen", main = "Oregon white oak sensitivity")
maps::map("state", regions = c("California", "Oregon", "Washington"), add = T, resolution = 0)
maps::map("world", regions = c("Canada"), add = T, resolution = 0)
stretchPlot(s.map, type = "sd", n = 2, add = T,
    smallplot = c(.7, .71, .3, .7))

## ----"departure"---------------------------------------------------------
dep <- departure(x = climdat.hist, y = climdat.fut, s.dat = QUGA, field = "CODE")
dep

## ----"exposure-map", echo=1----------------------------------------------
e.map <- exposure_map(dep)
par(mar = c(1, 1, 1, 1))
plot(QUGA, col = "darkgreen", main = "Oregon white oak exposure")
maps::map("state", regions = c("California", "Oregon", "Washington"), add = T, resolution = 0)
maps::map("world", regions = c("Canada"), add = T, resolution = 0)
stretchPlot(e.map, type = "sd", n = 2, add = T,
    smallplot = c(.7, .71, .3, .7))

## ------------------------------------------------------------------------
vuln <- vulnerability(cnfa = mod.cnfa, dep = dep)
vuln

## ----"vulnerability-map", echo=1-----------------------------------------
v.map <- vulnerability_map(vuln)
par(mar = c(1, 1, 1, 1))
plot(QUGA, col = "darkgreen", main = "Oregon white oak vulnerability")
maps::map("state", regions = c("California", "Oregon", "Washington"), add = T, resolution = 0)
maps::map("world", regions = c("Canada"), add = T, resolution = 0)
stretchPlot(v.map, type = "sd", n = 2, add = T,
    smallplot = c(.7, .71, .3, .7))

## ----"parScale", eval=FALSE----------------------------------------------
#  clim.scaled <- parScale(x = climdat.hist, parallel = TRUE, n = 4)

## ----"parCov-1", eval=FALSE----------------------------------------------
#  mat <- parCov(x = climdat.hist, parallel = TRUE, n = 4)

## ----"parCov-2", eval=FALSE----------------------------------------------
#  mat <- parCov(x = climdat.hist, y = climdat.fut, parallel = TRUE, n = 4)

## ----"stretchPlot", fig.width=8, fig.height = 5--------------------------
sm <- sensitivity_map(mod.cnfa)
par(mfrow = c(1, 3), oma = c(1,1,1,1))
stretchPlot(sm, main = "linear")
stretchPlot(sm, type = "hist.equal", main = "Histogram equalization")
stretchPlot(sm, type = "sd", n = 2, main = "Standard deviation (n = 2)")

