library(lulcc)


### Name: Extract by index
### Title: Extract by index
### Aliases: 'Extract by index' [[,ExpVarRasterList,ANY,ANY-method
###   [[,CategoryLabel,ANY,ANY-method

### ** Examples


## Plum Island Ecosystems

## Load observed land use maps
obs <- ObsLulcRasterStack(x=pie,
                   pattern="lu",
                   categories=c(1,2,3),
                   labels=c("forest","built","other"),
                   t=c(0,6,14))

summary(obs[[1]])
summary(obs[[1:2]])




