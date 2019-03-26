library(GEOmap)


### Name: plotGEOmapXY
### Title: Plot a projected GEO map
### Aliases: plotGEOmapXY
### Keywords: hplot

### ** Examples


data('japmap', package='geomapdata' )
isel1 = which( japmap$STROKES$code != "i" & japmap$STROKES$num>120 )

PLOC=list(LON=c(137.008, 141.000), LAT=c(34.000, 36.992),
x=c(137.008, 141.000), y=c(34.000, 36.992) )
  PROJ = setPROJ(type=2, LAT0=mean(PLOC$y) , LON0=mean(PLOC$x) )
      
gxy = GLOB.XY(PLOC$LAT, PLOC$LON, PROJ)
 PLAT =  pretty(PLOC$LAT)
    PLAT = c(min(PLOC$LAT),
PLAT[PLAT>min(PLOC$LAT) & PLAT<max(PLOC$LAT)],max(PLOC$LAT)) 
  PLON  = pretty(PLOC$LON)
        PLON = c(min(PLOC$LON),
PLON[PLON>min(PLOC$LON) & PLON<max(PLOC$LON)], max(PLOC$LON))
     

plot(gxy$x, gxy$y,  asp=TRUE, ann=FALSE , axes=FALSE)

plotGEOmapXY(japmap,SEL=isel1,  LIM=c(PLOC$LON[1], PLOC$LAT[1],PLOC$LON[2],
     PLOC$LAT[2]) , PROJ=PROJ, add=TRUE )

addLLXY(PLAT,  PLON, PROJ=PROJ, LABS=TRUE, PMAT=NULL, TICS=c(.1,.1) )

###############
####  rotated map
PMAT = rotdelta4(-34)

 plotGEOmapXY(japmap, PMAT=PMAT,SEL=isel1, xpd=TRUE)





