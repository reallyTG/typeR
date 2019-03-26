library(PBSmapping)


### Name: addPoints
### Title: Add EventData/PolyData to an Existing Plot as Points
### Aliases: addPoints
### Keywords: aplot

### ** Examples

local(envir=.PBSmapEnv,expr={
  oldpar = par(no.readonly=TRUE)
  #--- load the data (if using R)
  if (!is.null(version$language) && (version$language=="R"))
    data(nepacLL,surveyData,envir=.PBSmapEnv)
  #--- plot a map
  plotMap(nepacLL, xlim=c(-136, -125), ylim=c(48, 57))
  #--- add events
  addPoints(surveyData, col=1:7)
  par(oldpar)
})



