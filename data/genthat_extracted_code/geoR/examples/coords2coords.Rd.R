library(geoR)


### Name: coords2coords
### Title: Operations on Coordinates
### Aliases: coords2coords zoom.coords zoom.coords.default
###   zoom.coords.geodata rect.coords
### Keywords: spatial

### ** Examples

foo <- matrix(c(4,6,6,4,2,2,4,4), nc=2)
foo1 <- zoom.coords(foo, 2)
foo1
foo2 <- coords2coords(foo, c(6,10), c(6,10))
foo2
plot(1:10, 1:10, type="n")
polygon(foo)
polygon(foo1, lty=2)
polygon(foo2, lwd=2)
arrows(foo[,1], foo[,2],foo1[,1],foo1[,2], lty=2)
arrows(foo[,1], foo[,2],foo2[,1],foo2[,2])
legend("topleft", 
       c("foo", "foo1 (zoom.coords)", "foo2 (coords2coords)"), lty=c(1,2,1), lwd=c(1,1,2))

## "zooming" part of The Gambia map
gb <- gambia.borders/1000
gd <- gambia[,1:2]/1000
plot(gb, ty="l", asp=1, xlab="W-E (kilometres)", ylab="N-S (kilometres)")
points(gd, pch=19, cex=0.5)
r1b <- gb[gb[,1] < 420,]
rc1 <- rect.coords(r1b, lty=2)

r1bn <- zoom.coords(r1b, 1.8, xoff=90, yoff=-90)
rc2 <- rect.coords(r1bn, xz=1.05)
segments(rc1[c(1,3),1],rc1[c(1,3),2],rc2[c(1,3),1],rc2[c(1,3),2], lty=3)

lines(r1bn)
r1d <- gd[gd[,1] < 420,]
r1dn <- zoom.coords(r1d, 1.7, xlim.o=range(r1b[,1],na.rm=TRUE), ylim.o=range(r1b[,2], na.rm=TRUE), 
                    xoff=90, yoff=-90)
points(r1dn, pch=19, cex=0.5)
text(450,1340, "Western Region", cex=1.5)



