library(PBSmapping)


### Name: calcConvexHull
### Title: Calculate the Convex Hull for a Set of Points
### Aliases: calcConvexHull
### Keywords: manip

### ** Examples

local(envir=.PBSmapEnv,expr={
  oldpar = par(no.readonly=TRUE)
  data(surveyData,envir=.PBSmapEnv)
  #--- plot the convex hull, and then plot the points
  plotMap(calcConvexHull(surveyData),col="moccasin")
  addPoints(surveyData,col="blue",pch=17,cex=.6)
  par(oldpar)
})



