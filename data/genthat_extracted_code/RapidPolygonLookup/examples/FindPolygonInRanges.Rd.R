library(RapidPolygonLookup)


### Name: FindPolygonInRanges
### Title: Use range-search to map points to polygon.
### Aliases: FindPolygonInRanges

### ** Examples


data(sf.crime.2012, envir = environment())
data(sf.polys, envir = environment())

sf.polys <- AddRanges(sf.polys)
XY <- FindPolygonInRanges(sf.polys, sf.crime.2012[1:1000,], verbose=0)

which(is.na(XY[,"census.block"]))
table(XY$rank)




