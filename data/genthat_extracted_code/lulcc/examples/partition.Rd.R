library(lulcc)


### Name: partition
### Title: Partition raster data
### Aliases: partition

### ** Examples


## Not run: 
##D 
##D ## Plum Island Ecosystems
##D 
##D ## Load observed land use maps
##D obs <- ObsLulcRasterStack(x=pie,
##D                    pattern="lu",
##D                    categories=c(1,2,3),
##D                    labels=c("forest","built","other"),
##D                    t=c(0,6,14))
##D 
##D ## create equally sized training and testing partitions
##D part <- partition(x=obs[[1]], size=0.1, spatial=FALSE)
##D names(part)
##D 
## End(Not run)



