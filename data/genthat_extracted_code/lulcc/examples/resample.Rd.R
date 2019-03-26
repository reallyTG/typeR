library(lulcc)


### Name: resample,ExpVarRasterList,Raster-method
### Title: Resample maps in ExpVarRasterList object or list
### Aliases: resample,ExpVarRasterList,Raster-method
###   resample,list,Raster-method

### ** Examples


## Not run: 
##D 
##D ## Plum Island Ecosystems
##D 
##D ## observed data
##D obs <- ObsLulcRasterStack(x=pie,
##D                     pattern="lu",
##D                     categories=c(1,2,3),
##D                     labels=c("forest","built","other"),
##D                     t=c(0,6,14))
##D 
##D ## explanatory variables
##D ef <- ExpVarRasterList(x=pie, pattern="ef")
##D 
##D ## resample to ensure maps have same characteristics as observed maps
##D ef <- resample(x=ef, y=obs, method="ngb")
##D 
## End(Not run)



