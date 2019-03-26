library(briskaR)


### Name: plot Landscape-class
### Title: Plot Method for a Landscape-class
### Aliases: 'plot Landscape-class' plot,Landscape,ANY-method

### ** Examples

## Not run: 
##D # plot a Landscape object
##D data(maize_65)
##D plot(maize.landscape)
##D # plot pollen dispersion at time 61 for maize data
##D ## create a ToxicIntensityRaster object
##D tox<-array(0,c(61,1024,1024))
##D tox[61,,]<-as.matrix(maize.toxicintensity61)
##D attr(tox,"class") <- "ToxicIntensityRaster"
##D ## plot tox over the landscape at time 61
##D plot(maize.landscape,objectT=tox,time=61)
## End(Not run)



