library(PBSmapping)


### Name: findCells
### Title: Find Grid Cells that Contain Events
### Aliases: findCells
### Keywords: manip

### ** Examples

local(envir=.PBSmapEnv,expr={
  oldpar = par(no.readonly=TRUE)
  #--- create some EventData: points in a diagonal line
  events <- data.frame(EID=1:11, X=seq(0, 2, length=11),
     Y=seq(0, 2, length=11))
  events <- as.EventData(events, projection=1);
  #--- create a PolySet (a grid)
  polys <- makeGrid (x=seq(0, 2, by=0.50), y=seq(0, 2, by=0.50), projection=1)
  #--- show a picture
  plotPolys(polys, xlim=range(polys$X)+c(-0.1, 0.1),
    ylim=range(polys$Y)+c(-0.1, 0.1), projection=1)
  addPoints(events, col=2)
  #--- run findCells and print the results
  fc <- findCells(events, polys)
  fc <- fc[order(fc$EID, fc$PID, fc$SID), ]
  fc$label <- paste(fc$PID, fc$SID, sep=", ")
  print (fc)
  #--- add labels to the graph
  addLabels(as.PolyData(fc[!duplicated(paste(fc$PID,fc$SID)), ],
    projection=1), placement="CENTROID", 
    polys=as.PolySet(polys, projection=1), col=4)
  par(oldpar)
})



