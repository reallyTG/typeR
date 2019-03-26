library(SPADAR)


### Name: createAllSkyGridChart
### Title: Creates all-sky grid charts
### Aliases: createAllSkyGridChart
### Keywords: aplot dplot hplot

### ** Examples

# Creates an all sky chart with Equatorial, Ecliptic and Galactic coordinate systems superposed, 
# with the Equatorial as the main system in black, the Ecliptic in blue with 0.5 transparency and 
# dashed lines and the Galactic in red with 0.5 transparency and dashed lines
createAllSkyGridChart(mainGrid="equatorial", eqDraw=TRUE, eclDraw=TRUE, galDraq=TRUE, 
  eqCol="black", eclCol=rgb(0,0,1,0.5), galCol=rgb(1,0,0,0.5), eqLty=1, eclLty=2, galLty=2)

# Equatorial and Galactic coordinate systems represented in a polyconic projection
createAllSkyGridChart(mainGrid="equatorial", eqDraw=TRUE, eclDraw=FALSE, galDraq=TRUE, 
  eqCol="black", galCol=rgb(1,0,0,0.5), eqLty=1, galLty=2, projname="polyconic")

# The same as above, but in non-standard Aitoff projection with the South Pole 
# in the center og the projection
createAllSkyGridChart(mainGrid="equatorial", eqDraw=TRUE, eclDraw=TRUE, galDraq=TRUE, 
  eqCol="black", eclCol=rgb(0,0,1,0.5), galCol=rgb(1,0,0,0.5), eqLty=1, eclLty=2, 
  galLty=2, projname="aitoff", projorient=c(0,0,0))



