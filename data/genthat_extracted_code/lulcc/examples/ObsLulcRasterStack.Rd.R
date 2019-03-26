library(lulcc)


### Name: ObsLulcRasterStack
### Title: Create an ObsLulcRasterStack object
### Aliases: ObsLulcRasterStack ObsLulcRasterStack,missing,character-method
###   ObsLulcRasterStack,character,character-method
###   ObsLulcRasterStack,list,character-method
###   ObsLulcRasterStack,RasterLayer,ANY-method
###   ObsLulcRasterStack,RasterStack,ANY-method

### ** Examples


## Plum Island Ecosystems
obs <- ObsLulcRasterStack(x=pie,
                   pattern="lu",
                   categories=c(1,2,3),
                   labels=c("forest","built","other"),
                   t=c(0,6,14))

## Sibuyan Island
obs <- ObsLulcRasterStack(x=sibuyan$maps,
                   pattern="lu",
                   categories=c(1,2,3,4,5),
                   labels=c("forest","coconut","grass","rice","other"),
                   t=c(0,14))




