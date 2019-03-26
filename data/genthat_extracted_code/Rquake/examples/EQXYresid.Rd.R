library(Rquake)


### Name: EQXYresid
### Title: Calculate Residuals
### Aliases: EQXYresid
### Keywords: misc

### ** Examples


## Not run: 
##D  XY = GEOmap::GLOB.XY(pstas$lat, pstas$lon, proj)
##D     elcor = rep(0, length(pstas$lat))
##D     
##D     DZ = pstas$z - mean(stas$z)
##D     
##D     elcor[pstas$phase=="P"] = DZ[pstas$phase=="P"]/v$vp[1]
##D     elcor[pstas$phase=="S"] = DZ[pstas$phase=="S"]/v$vs[1]
##D     
##D     XY$cor = elcor
##D     XY$phase = pstas$phase
##D     XY$sec = pstas$sec
##D     
##D     eqXY = GEOmap::GLOB.XY(sol[1], sol[2], proj)
##D     res =  EQXYresid(XY, vel=v , h1=c(eqXY$x, eqXY$y, sol[2],sol[4]) , PLOT=FALSE)
##D     
## End(Not run)





