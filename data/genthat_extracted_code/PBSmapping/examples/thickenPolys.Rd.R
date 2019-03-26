library(PBSmapping)


### Name: thickenPolys
### Title: Thicken a PolySet of Polygons
### Aliases: thickenPolys
### Keywords: manip

### ** Examples

local(envir=.PBSmapEnv,expr={
  oldpar = par(no.readonly=TRUE)
  #--- load the data (if using R)
  if (!is.null(version$language) && (version$language=="R"))
    data(nepacLL,envir=.PBSmapEnv)
  #--- plot Vancouver Island
  plotMap(nepacLL[nepacLL$PID == 33, ])
  #--- calculate a thickened version using a 30 kilometres tolerance,
  #--- without keeping the original points
  p <- thickenPolys(nepacLL[nepacLL$PID == 33, ], tol = 30, keepOrig = FALSE)
  #--- convert the PolySet to EventData by dropping the PID column and
  #--- renaming POS to EID
  p <- p[-1]; names(p)[1] <- "EID"
  #--- convert the now invalid PolySet into a data frame, and then into
  #--- EventData
  p <- as.EventData(as.data.frame(p), projection="LL")
  #--- plot the results
  addPoints(p, col=2, pch=19)
  par(oldpar)
})



