library(geoR)


### Name: points.geodata
### Title: Plots Spatial Locations and Data Values
### Aliases: points.geodata
### Keywords: spatial dplot aplot

### ** Examples

op <- par(no.readonly = TRUE)
par(mfrow=c(2,2), mar=c(3,3,1,1), mgp = c(2,1,0))
points(s100, xlab="Coord X", ylab="Coord Y")
points(s100, xlab="Coord X", ylab="Coord Y", pt.divide="rank.prop")
points(s100, xlab="Coord X", ylab="Coord Y", cex.max=1.7,
               col=gray(seq(1, 0.1, l=100)), pt.divide="equal")
points(s100, pt.divide="quintile", xlab="Coord X", ylab="Coord Y")
par(op)

points(ca20, pt.div='quartile', x.leg=4900, y.leg=5850, bor=borders)

par(mfrow=c(1,2), mar=c(3,3,1,1), mgp = c(2,1,0))
points(s100, main="Original data")
points(s100, permute=TRUE, main="Permuting locations")

## Now an example using 2 variable, 1 defining the
## gray scale and the other the points size
points.geodata(coords=camg[,1:2], data=camg[,3], col="gray",
               cex.var=camg[,5])
points.geodata(coords=camg[,1:2], data=camg[,3], col="gray",
               cex.var=camg[,5], pt.div="quint")



