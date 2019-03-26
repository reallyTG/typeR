library(sptemExp)


### Name: colorCusGrinf
### Title: Customed Color Generation by the Number of the Levels
### Aliases: colorCusGrinf
### Keywords: ~colorCusGrinf ~raster

### ** Examples


data("spointspre","countylayer")
praster=sptemExp::points2Raster(spointspre,"d91")
dtStr=as.character(as.Date(91,origin=as.Date("2014-01-1")))
title=expression("PM"[2.5]*" Concentration Estimated")
par(mar=c(4,4,1,1))
breakpoints = c(0,50,100,200,350,600)
colors=colorCusGrinf(breakpoints,c("darkgreen","yellow","darkred"))
raster::plot(praster,breaks=breakpoints,col=colors,
    main=title,xlab=paste("Shandong Province, China (",dtStr,")",sep=""))




