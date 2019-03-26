library(PBSmapping)


### Name: addLabels
### Title: Add Labels to an Existing Plot
### Aliases: addLabels
### Keywords: aplot

### ** Examples

local(envir=.PBSmapEnv,expr={
  oldpar = par(no.readonly=TRUE)
  #--- create sample PolyData to label Vancouver Island
  labelData <- data.frame(PID=33, label="Vancouver Island");
  #--- load data
  if (!is.null(version$language) && (version$language == "R"))
    data(nepacLL,envir=.PBSmapEnv)
  #--- plot the map
  plotMap(nepacLL,xlim=c(-129,-122.6),ylim=c(48,51.1),col="lemonchiffon")
  #--- add the labels
  addLabels(labelData,placement="CENTROID",polys=nepacLL,cex=1.2,col=2,font=2)
  par(oldpar)
})



