library(GSIF)


### Name: spline.krige
### Title: Kriging combined with splines
### Aliases: spline.krige resample.grid

### ** Examples

## Not run: 
##D library(plotKML)
##D library(spatstat)
##D library(RSAGA)
##D library(gstat)
##D library(raster)
##D data(eberg)
##D data(eberg_grid)
##D data(eberg_grid25)
##D library(sp)
##D coordinates(eberg) <- ~X+Y
##D proj4string(eberg) <- CRS("+init=epsg:31467")
##D m <- vgm(psill=320, model="Exp", range=1200, nugget=160)
##D plot(variogram(SNDMHT_A~1, eberg[!is.na(eberg$SNDMHT_A),]), m)
##D ## prediction locations:
##D gridded(eberg_grid) <- ~x+y
##D proj4string(eberg_grid) <- CRS("+init=epsg:31467")
##D gridded(eberg_grid25) <- ~x+y
##D proj4string(eberg_grid25) <- CRS("+init=epsg:31467")
##D ## prepare prediction locations for spline.krige:
##D grd <- resample.grid(locations=eberg["SNDMHT_A"], t_cellsize=25,
##D    newdata=eberg_grid25, optN=5, quant.nndist=.9)
##D ## plot resampled grid:
##D plot(raster(grd$density))
##D plot(grd$newlocs)
##D points(eberg, pch=19, col="red", cex=.7)
##D env <- rsaga.env()
##D if(exists("env") & env$version=="2.1.0"){
##D  ## compare processing time:
##D  system.time( SND.sok <- spline.krige(locations=eberg["SNDMHT_A"], 
##D       t_cellsize=25, newdata=eberg_grid25, 
##D       newlocs=grd$newlocs, model=m, nmax=30) )
##D  system.time( SND.ok <- krige(SNDMHT_A~1, 
##D       eberg[!is.na(eberg$SNDMHT_A),], 
##D       newdata=eberg_grid, m, 
##D       debug.level = -1, nmax=30) )
##D  system.time( SND.ok25 <- krige(SNDMHT_A~1, 
##D       eberg[!is.na(eberg$SNDMHT_A),], 
##D       newdata=eberg_grid25, m, 
##D       debug.level = -1, nmax=30) )  
##D  ## compare outputs visually:
##D  par(mfrow=c(1,3))
##D  plot(raster(SND.sok[1]), main="spline.krige (25 m)")
##D  plot(raster(SND.ok25[1]), main="krige (25 m)")
##D  plot(raster(SND.ok[1]), main="krige (100 m)") 
##D }
## End(Not run)
## conclusion: spline.krige produces less artifacts, 
## and is at order of magnitude faster than simple 'krige'



