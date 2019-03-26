library(SPADAR)


### Name: SPADAR-package
### Title: Spherical Projections of Astronomical Data
### Aliases: SPADAR-package SPADAR
### Keywords: package

### ** Examples

# Creates an all sky chart with Equatorial, Ecliptic and Galactic coordinate systems
# superposed. Equatorial as the main system in black, the Ecliptic in blue and the 
# Galactic in red
createAllSkyGridChart(mainGrid="equatorial", eqDraw=TRUE, eclDraw=TRUE, galDraq=TRUE, 
  eqCol="black", eclCol=rgb(0,0,1,0.5), galCol=rgb(1,0,0,0.5), eqLty=1, eclLty=2, galLty=2)

# Creates an all sky scatter plot of the Pierre Auger Observatory 2014 public event list 
# (arXiv:1411.6111). Equatorial and Galactic coordinate systems superposed;
# Galactic as the main system in black and the Equatorial in red.
data(uhecrauger2014)
createAllSkyScatterPlotChart(uhecrauger2014$RA, uhecrauger2014$DEC, mainGrid="galactic",
  dataCoordSys="equatorial", pointcol="black", pch=19, 
  pointsize=uhecrauger2014$Eev/max(uhecrauger2014$Eev),
  eqDraw=TRUE, eclDraw=FALSE, galDraq=TRUE, galCol="black", eqLty=2, galLty=1, 
  eqCol=rgb(1,0,0,0.5))
  
# Creates a grid with the Galactic Coordinate system and overplots data
createAllSkyGridChart(mainGrid="galactic", eqDraw=FALSE, eclDraw=FALSE, galDraq=TRUE, 
  galCol=rgb(0,0,0,0.5), galLty=1)
overplotScatterPlotInAllSkyGridChart(uhecrauger2014$RA, uhecrauger2014$DEC, 
  mainGrid="galactic", dataCoordSys="equatorial", pointcol="black", pch=19, 
  pointsize=uhecrauger2014$Eev/max(uhecrauger2014$Eev))



