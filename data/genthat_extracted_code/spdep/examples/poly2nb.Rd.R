library(spdep)


### Name: poly2nb
### Title: Construct neighbours list from polygon list
### Aliases: poly2nb
### Keywords: spatial

### ** Examples

if (require(rgdal, quietly=TRUE)) {
example(columbus, package="spData")
coords <- coordinates(columbus)
xx <- poly2nb(columbus)
dxx <- diffnb(xx, col.gal.nb)
plot(columbus, border="grey")
plot(col.gal.nb, coords, add=TRUE)
plot(dxx, coords, add=TRUE, col="red")
title(main=paste("Differences (red) in Columbus GAL weights (black)",
 "and polygon generated queen weights", sep="\n"))
xxx <- poly2nb(columbus, queen=FALSE)
dxxx <- diffnb(xxx, col.gal.nb)
plot(columbus, border = "grey")
plot(col.gal.nb, coords, add = TRUE)
plot(dxxx, coords, add = TRUE, col = "red")
title(main=paste("Differences (red) in Columbus GAL weights (black)",
 "and polygon generated rook weights", sep="\n"))
cards <- card(xx)
maxconts <- which(cards == max(cards))
if(length(maxconts) > 1) maxconts <- maxconts[1]
fg <- rep("grey", length(cards))
fg[maxconts] <- "red"
fg[xx[[maxconts]]] <- "green"
plot(columbus, col=fg)
title(main="Region with largest number of contiguities")
example(nc.sids, package="spData")
system.time(xxnb <- poly2nb(nc.sids))
plot(nc.sids)
plot(xxnb, coordinates(nc.sids), add=TRUE, col="blue")
}



