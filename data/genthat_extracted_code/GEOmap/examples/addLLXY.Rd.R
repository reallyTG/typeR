library(GEOmap)


### Name: addLLXY
### Title: Add Lat-Lon points using projection
### Aliases: addLLXY
### Keywords: aplot

### ** Examples


library(geomapdata)


data('fujitopo', package='geomapdata')
data('japmap', package='geomapdata')

PLOC=list(LON=range(c( japmap$STROKES$LON1,japmap$STROKES$LON2) ),
LAT=range(c( japmap$STROKES$LAT1,japmap$STROKES$LAT2) ))
PLOC$x = PLOC$LON
PLOC$y = PLOC$LAT

PROJ = setPROJ(type=2, LAT0=mean(PLOC$y) , LON0=mean(PLOC$x) )
isel1 = which( japmap$STROKES$code != "i" & japmap$STROKES$num>120 )


plotGEOmapXY(japmap, PROJ=PROJ,SEL=isel1,  add=FALSE, axes=FALSE, xlab="", ylab="")
A = PLOC

   PLAT =  pretty(A$LAT)
    PLAT = c(min(A$LAT),  PLAT[PLAT>min(A$LAT) & PLAT<max(A$LAT)],max(A$LAT)) 
  PLON  = pretty(A$LON)
        PLON = c(min(A$LON), PLON[PLON>min(A$LON) & PLON<max(A$LON)],
 max(A$LON))


addLLXY(PLAT,  PLON, PROJ=PROJ, LABS=TRUE, PMAT=NULL, TICS=c(.1,.1) )

###############





