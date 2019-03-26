library(geostatsp)


### Name: lgm-methods
### Title: Linear Geostatistical Models
### Aliases: lgm lgm-methods lgm,missing,ANY,ANY,ANY-method
###   lgm,numeric,ANY,ANY,ANY-method lgm,character,ANY,ANY,ANY-method
###   lgm,formula,Spatial,numeric,ANY-method
###   lgm,formula,Spatial,Raster,missing-method
###   lgm,formula,Spatial,Raster,list-method
###   lgm,formula,Spatial,Raster,Raster-method
###   lgm,formula,Spatial,Raster,data.frame-method
###   lgm,formula,Raster,ANY,ANY-method
###   lgm,formula,data.frame,Raster,data.frame-method

### ** Examples


data("swissRain")
 
swissRes =  lgm( formula="rain", 
	data=swissRain[1:60,], grid=20,
	covariates=swissAltitude, boxcox=0.5, fixBoxcox=TRUE, 
	shape=1, fixShape=TRUE,
	aniso=FALSE, nugget=0, fixNugget=FALSE,
	nuggetInPrediction=FALSE
)

swissRes$summary

plot(swissRes$predict[["predict"]], main="predicted rain") 
plot(swissBorder, add=TRUE)



## Not run: 
##D load(url("http://www.filefactory.com/file/frd1mhownd9/n/CHE_adm0_RData"))
##D 
##D library('RColorBrewer')
##D par(mar=c(0,0,0,3))
##D plot(gadm) 
##D plot(mask(projectRaster(
##D 	swissRes$predict[["predict"]],  crs=gadm@proj4string),gadm), 
##D add=T,alpha=0.6, col=brewer.pal(9, "Blues"))
##D plot(gadm, add=TRUE)
##D 
## End(Not run)







