library(EGRET)


### Name: plotDiffContours
### Title: Plots the difference between two years from a contour plot
###   created by plotContours
### Aliases: plotDiffContours
### Keywords: graphics statistics water-quality

### ** Examples

year0<-2001
year1<-2009
qBottom<-0.33
qTop<-22
maxDiff<-0.5
eList <- Choptank_eList
plotDiffContours(eList, year0,year1)
plotDiffContours(eList, year0,year1,maxDiff=maxDiff)
plotDiffContours(eList, year0,year1,qBottom,qTop,maxDiff)

yTicksModified <- c(.1,1,10,25)
plotDiffContours(eList, year0, year1,qBottom,qTop,maxDiff,
       yTicks=yTicksModified,flowDuration=FALSE)
colors <-colorRampPalette(c("blue","white","red"))
plotDiffContours(eList, year0,year1,qBottom,qTop,maxDiff,
       color.palette=colors,flowDuration=FALSE)
colors2 <- heat.colors # Some other options: topo.colors, terrain.colors, cm.colors
plotDiffContours(eList, year0,year1,qBottom,qTop,maxDiff,
       lwd=2,color.palette=colors2,flowDuration=FALSE)
plotDiffContours(eList, year0,year1,qBottom,qTop,maxDiff,cex.lab=2,flowDuration=FALSE)
par(mar=c(5,8,5,8))
plotDiffContours(eList, year0,year1,qBottom,qTop,maxDiff,
       customPar=TRUE,flowDuration=FALSE)



