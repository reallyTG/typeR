library(maptools)


### Name: leglabs
### Title: Make legend labels
### Aliases: leglabs
### Keywords: spatial

### ** Examples

mappolys <- readShapeSpatial(system.file("shapes/columbus.shp", package="maptools")[1], ID="NEIGNO")
brks <- round(quantile(mappolys$CRIME, probs=seq(0,1,0.2)), digits=2)
colours <- c("salmon1", "salmon2", "red3", "brown", "black")
plot(mappolys, col=colours[findInterval(mappolys$CRIME, brks,
 all.inside=TRUE)])
legend(x=c(5.8, 7.1), y=c(13, 14.5), legend=leglabs(brks),
  fill=colours, bty="n")
title(main=paste("Columbus OH: residential burglaries and vehicle",
 "thefts per thousand households, 1980", sep="\n"))
#legend with reversed order
plot(mappolys, col=colours[findInterval(mappolys$CRIME, brks,
 all.inside=TRUE)])
legend(x=c(5.8, 7.1), y=c(13, 14.5), legend=leglabs(brks, reverse = TRUE),
  fill=rev(colours), bty="n")
title(main=paste("Columbus OH: residential burglaries and vehicle",
 "thefts per thousand households, 1980 (reversed legend)", sep="\n"))



