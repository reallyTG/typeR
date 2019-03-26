library(lulcc)


### Name: as.data.frame.ExpVarRasterList
### Title: Coerce objects to data.frame
### Aliases: as.data.frame.ExpVarRasterList
###   as.data.frame.ObsLulcRasterStack
###   as.data.frame,ExpVarRasterList-method
###   as.data.frame,ObsLulcRasterStack-method

### ** Examples


## Not run: 
##D 
##D ## Plum Island Ecosystems
##D 
##D ## observed maps
##D obs <- ObsLulcRasterStack(x=pie,
##D                           pattern="lu", 
##D                           categories=c(1,2,3), 
##D                           labels=c("Forest","Built","Other"), 
##D                           t=c(0,6,14))
##D 
##D ## explanatory variables
##D ef <- ExpVarRasterList(x=pie, pattern="ef")
##D 
##D ## separate data into training and testing partitions
##D part <- partition(x=obs[[1]], size=0.1, spatial=TRUE)
##D df1 <- as.data.frame(x=obs, cells=part[["all"]], t=0)
##D df2 <- as.data.frame(x=ef, cells=part[["all"]], t=0)
##D 
## End(Not run)



