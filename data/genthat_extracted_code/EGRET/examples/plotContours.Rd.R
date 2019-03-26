library(EGRET)


### Name: plotContours
### Title: Color contour plot of the estimated surfaces as a function of
###   discharge and time (surfaces include log concentration, standard
###   error, and concentration)
### Aliases: plotContours
### Keywords: graphics statistics water-quality

### ** Examples

yearStart <- 2001
yearEnd <- 2010
qBottom <- 0.5
qTop<- 22
clevel <- seq(0,3.5,0.5)
eList <- Choptank_eList
plotContours(eList, yearStart,yearEnd,qBottom,qTop, contourLevels = clevel)  
plotContours(eList, yearStart,yearEnd,qBottom=0.1,qTop=NA, contourLevels = clevel) 
yTicksModified <- c(.1,1,10,25)
plotContours(eList, yearStart,yearEnd,qBottom,qTop, 
      contourLevels = clevel,yTicks=yTicksModified,flowDuration=FALSE)  
colors <- colorRampPalette(c("white","red"))
plotContours(eList, yearStart,yearEnd,qBottom,qTop, 
       contourLevels = clevel,yTicks=yTicksModified,
       color.palette=colors,flowDuration=FALSE)
colors2 <- heat.colors # Some other options: topo.colors, terrain.colors, cm.colors
plotContours(eList, yearStart,yearEnd,qBottom,qTop,
       contourLevels = clevel,color.palette=colors2,lwd=2,flowDuration=FALSE)
plotContours(eList, yearStart,yearEnd,qBottom,qTop, 
       contourLevels = clevel,cex.axis=2,flowDuration=FALSE)
par(mar=c(5,8,5,8))
plotContours(eList, yearStart,yearEnd,qBottom,qTop, 
       contourLevels = clevel,customPar=TRUE,printTitle=FALSE,flowDuration=FALSE)



