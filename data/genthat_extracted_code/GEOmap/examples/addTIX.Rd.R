library(GEOmap)


### Name: addTIX
### Title: Add Tic marks to map
### Aliases: addTIX
### Keywords: aplot

### ** Examples


##########3  this program is run internally


PLOC=list(LON=c(137.008, 141.000),
LAT=c(34.000, 36.992),
x=c(137.008, 141.000),
y=c(34.000, 36.992))

PROJ = setPROJ(type=2, LAT0=mean(PLOC$y) , LON0=mean(PLOC$x) )

gxy = GLOB.XY(PLOC$LAT, PLOC$LON, PROJ)

PLAT =  pretty(PLOC$LAT)

PLAT = c(min(PLOC$LAT),PLAT[PLAT>min(PLOC$LAT)&PLAT<max(PLOC$LAT)],max(PLOC$LAT)) 

PLON  = pretty(PLOC$LON)

PLON = c(min(PLOC$LON), PLON[PLON>min(PLOC$LON)&PLON<max(PLOC$LON)], max(PLOC$LON))
     

plot(gxy$x, gxy$y,  asp=TRUE)

 addTIX(PLAT, PLON, PMAT=NULL, col='red', TICS=c(.1,.1), PROJ=PROJ)




   




