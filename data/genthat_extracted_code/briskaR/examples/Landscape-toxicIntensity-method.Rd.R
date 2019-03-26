library(briskaR)


### Name: toxicIntensity
### Title: toxicIntensity Method
### Aliases: toxicIntensity toxicIntensity,Landscape-method toxicIntensity
###   toxicIntensity,Landscape-method

### ** Examples

## Not run: 
##D data(maize_65)
##D data(maize.emitted_pollen)
##D raster.size <- 1024
##D tox <- toxicIntensity(maize.landscape,maize.emitted_pollen,
##D mintime=1,maxtime=61,size_raster=raster.size)
##D # plot particles dispersion at time 30
##D image(x=1:raster.size, y=1:raster.size, z=tox[30,,])
##D # plot the landscape and the pollen dispersion at time 61
##D plot(maize.landscape,objectT=tox,time=61)
## End(Not run)



