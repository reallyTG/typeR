library(PBSmapping)


### Name: addCompass
### Title: Add Compass to Map
### Aliases: addCompass
### Keywords: aplot

### ** Examples

local(envir=.PBSmapEnv,expr={
  data(nepacLL,envir=.PBSmapEnv)
  par(mfrow=c(1,1),mar=c(3,4,0.5,0.5))
  plotMap(nepacLL, xlim=c(-134.5,-124.5), ylim=c(48,55), plt=NULL,
    col="lightyellow", cex.axis=1.2, cex.lab=1.5)
  addCompass(-132, 49.5, cex=1.5)
})



