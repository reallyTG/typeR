library(lulcc)


### Name: crossTabulate
### Title: Cross tabulate land use transitions
### Aliases: crossTabulate crossTabulate,RasterLayer,RasterLayer-method
###   crossTabulate,ObsLulcRasterStack,ANY-method

### ** Examples


## Plum Island Ecosystems 

## Load observed land use maps
obs <- ObsLulcRasterStack(x=pie,
                   pattern="lu",
                   categories=c(1,2,3),
                   labels=c("forest","built","other"),
                   t=c(0,6,14))

crossTabulate(x=obs, times=c(0,14))

## RasterLayer input
crossTabulate(x=obs[[1]],
              y=obs[[3]],
              categories=c(1,2,3),
              labels=c("forest","built","other"))




