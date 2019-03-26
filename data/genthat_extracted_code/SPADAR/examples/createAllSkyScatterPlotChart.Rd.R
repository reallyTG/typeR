library(SPADAR)


### Name: createAllSkyScatterPlotChart
### Title: Creates all-sky scatter plots
### Aliases: createAllSkyScatterPlotChart
### Keywords: aplot dplot hplot

### ** Examples

# Creates an all sky scatter plot of the Pierre Auger Observatory 2014 public event list 
# (arXiv:1411.6111), with Equatorial and Galactic coordinate systems superposed, and using
# the Galactic as the main system in black and the Equatorial in red with 0.5 transparency
# and dashed lines. The point sizes encode the energy of the cosmic ray.

data(uhecrauger2014)

createAllSkyScatterPlotChart(uhecrauger2014$RA, uhecrauger2014$DEC, mainGrid="galactic",
  dataCoordSys="equatorial", pointcol="black", pch=19, 
  pointsize=uhecrauger2014$Eev/max(uhecrauger2014$Eev),
  eqDraw=TRUE, eclDraw=FALSE, galDraq=TRUE, galCol="black", eqLty=2, galLty=1, 
  eqCol=rgb(1,0,0,0.5))



