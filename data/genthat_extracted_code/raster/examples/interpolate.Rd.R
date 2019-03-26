library(raster)


### Name: interpolate
### Title: Interpolate
### Aliases: interpolate interpolate,Raster-method
### Keywords: methods spatial

### ** Examples

## Not run: 
##D ## Thin plate spline interpolation with x and y only
##D # some example data
##D r <- raster(system.file("external/test.grd", package="raster"))
##D ra <- aggregate(r, 10)
##D xy <- data.frame(xyFromCell(ra, 1:ncell(ra)))
##D v <- getValues(ra)
##D 
##D #### Thin plate spline model
##D library(fields) 
##D tps <- Tps(xy, v)
##D p <- raster(r)
##D 
##D # use model to predict values at all locations
##D p <- interpolate(p, tps)
##D p <- mask(p, r)
##D 
##D plot(p)
##D ## change the fun from predict to fields::predictSE to get the TPS standard error
##D se <- interpolate(p, tps, fun=predictSE)
##D se <- mask(se, r)
##D plot(se)
##D 
##D ## another variable; let's call it elevation
##D elevation <- (init(r, 'x') * init(r, 'y')) / 100000000
##D names(elevation) <- 'elev'
##D elevation <- mask(elevation, r)
##D 
##D z <- extract(elevation, xy)
##D 
##D # add as another independent variable
##D xyz <- cbind(xy, z)
##D tps2 <- Tps(xyz, v)
##D p2 <- interpolate(elevation, tps2, xyOnly=FALSE)
##D 
##D # as a linear coveriate
##D tps3 <- Tps(xy, v, Z=z)
##D 
##D # Z is a separate argument in Krig.predict, so we need a new function
##D # Internally (in interpolate) a matrix is formed of x, y, and elev (Z)
##D 
##D pfun <- function(model, x, ...) {
##D    predict(model, x[,1:2], Z=x[,3], ...)
##D }
##D p3 <- interpolate(elevation, tps3, xyOnly=FALSE, fun=pfun)
##D 
##D #### gstat examples
##D library(gstat)
##D data(meuse)
##D 
##D ## inverse distance weighted (IDW)
##D r <- raster(system.file("external/test.grd", package="raster"))
##D data(meuse)
##D mg <- gstat(id = "zinc", formula = zinc~1, locations = ~x+y, data=meuse, 
##D             nmax=7, set=list(idp = .5))
##D z <- interpolate(r, mg)
##D z <- mask(z, r)
##D 
##D ## kriging
##D coordinates(meuse) <- ~x+y
##D projection(meuse) <- projection(r)
##D 
##D ## ordinary kriging
##D v <- variogram(log(zinc)~1, meuse)
##D m <- fit.variogram(v, vgm(1, "Sph", 300, 1))
##D gOK <- gstat(NULL, "log.zinc", log(zinc)~1, meuse, model=m)
##D OK <- interpolate(r, gOK)
##D 
##D # examples below provided by Maurizio Marchi
##D ## universial kriging
##D vu <- variogram(log(zinc)~elev, meuse)
##D mu <- fit.variogram(vu, vgm(1, "Sph", 300, 1))
##D gUK <- gstat(NULL, "log.zinc", log(zinc)~elev, meuse, model=mu)
##D names(r) <- 'elev'
##D UK <- interpolate(r, gUK, xyOnly=FALSE)
##D 
##D ## co-kriging
##D gCoK <- gstat(NULL, 'log.zinc', log(zinc)~1, meuse)
##D gCoK <- gstat(gCoK, 'elev', elev~1, meuse)
##D gCoK <- gstat(gCoK, 'cadmium', cadmium~1, meuse)
##D gCoK <- gstat(gCoK, 'copper', copper~1, meuse)
##D coV <- variogram(gCoK)
##D plot(coV, type='b', main='Co-variogram')
##D coV.fit <- fit.lmc(coV, gCoK, vgm(model='Sph', range=1000))
##D coV.fit
##D plot(coV, coV.fit, main='Fitted Co-variogram')
##D coK <- interpolate(r, coV.fit)
##D plot(coK)
## End(Not run)



