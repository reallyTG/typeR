library(adehabitatHS)


### Name: canomi
### Title: Canonical OMI analysis
### Aliases: canomi print.canomi plot.canomi
### Keywords: multivariate

### ** Examples

## The data
data(puech)
locs <- puech$relocations
maps <- puech$maps

## the maps
mimage(maps)

## the relocations of the wild boar:
image(maps)
points(locs, col=as.numeric(slot(locs, "data")[,1]))


## count the number of relocations
## in each pixel of the maps
cp <- count.points(locs, maps)

## gets the data:
dfavail <- slot(maps, "data")
dfused <- slot(cp, "data")

## a preliminary principal component analysis of the data:
dud <- dudi.pca(dfavail, scannf=FALSE)

## The analysis:
nic <- canomi(dud, dfused, scannf=FALSE)
nic

## Plot the results:
plot(nic)





