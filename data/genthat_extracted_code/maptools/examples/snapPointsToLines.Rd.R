library(maptools)


### Name: snapPointsToLines
### Title: Snap a set of points to a set of lines
### Aliases: snapPointsToLines
### Keywords: spatial

### ** Examples

# From the sp vignette
l1 = cbind(c(1,2,3),c(3,2,2))
l1a = cbind(l1[,1]+.05,l1[,2]+.05)
l2 = cbind(c(1,2,3),c(1,1.5,1))
Sl1 = Line(l1)
Sl1a = Line(l1a)
Sl2 = Line(l2)
S1 = Lines(list(Sl1, Sl1a), ID="a")
S2 = Lines(list(Sl2), ID="b")
Sl = SpatialLines(list(S1,S2))
df = data.frame(z = c(1,2), row.names=sapply(slot(Sl, "lines"), function(x) slot(x, "ID")))
Sldf = SpatialLinesDataFrame(Sl, data = df)

xc = c(1.2,1.5,2.5)
yc = c(1.5,2.2,1.6)
Spoints = SpatialPoints(cbind(xc, yc))

if (rgeosStatus()) snapPointsToLines(Spoints, Sldf)



