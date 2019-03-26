library(PBSmapping)


### Name: addStipples
### Title: Add Stipples to an Existing Plot
### Aliases: addStipples
### Keywords: aplot

### ** Examples

local(envir=.PBSmapEnv,expr={
  oldpar = par(no.readonly=TRUE)
  #--- load the data (if using R)
  if (!is.null(version$language) && (version$language=="R"))
    data(nepacLL,envir=.PBSmapEnv)
  #--- plot a map
  plotMap(nepacLL,xlim=c(-128.66,-122.83),ylim=c(48.00,51.16))
  #--- add stippling
  addStipples(nepacLL,col="purple",pch=20,cex=0.25,distance=2)
  par(oldpar)
})



