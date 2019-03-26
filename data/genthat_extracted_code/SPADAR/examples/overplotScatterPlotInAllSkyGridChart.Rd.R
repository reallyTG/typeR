library(SPADAR)


### Name: overplotScatterPlotInAllSkyGridChart
### Title: Overplots positions in some coordinate system on top of all-sky
###   chart plots.
### Aliases: overplotScatterPlotInAllSkyGridChart
### Keywords: aplot dplot hplot

### ** Examples

# Creates a grid with the Galactic Coordinate system.

createAllSkyGridChart(mainGrid="galactic", eqDraw=FALSE, eclDraw=FALSE, galDraq=TRUE, 
  galCol=rgb(0,0,0,0.5), galLty=1)

# Overplots the Pierre Auger Observatory 2014 public event list (arXiv:1411.6111).

data(uhecrauger2014)

overplotScatterPlotInAllSkyGridChart(uhecrauger2014$RA, uhecrauger2014$DEC, 
  mainGrid="galactic", dataCoordSys="equatorial", pointcol="black", pch=19, 
  pointsize=uhecrauger2014$Eev/max(uhecrauger2014$Eev))



