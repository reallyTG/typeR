library(spdep)


### Name: autocov_dist
### Title: Distance-weighted autocovariate
### Aliases: autocov_dist
### Keywords: spatial

### ** Examples

if (require(rgdal, quietly=TRUE)) {
example(columbus, package="spData")
xy <- cbind(columbus$X, columbus$Y)
ac1a <- autocov_dist(columbus$CRIME, xy, nbs=10, style="B",
 type="one")
acinva <- autocov_dist(columbus$CRIME, xy, nbs=10, style="B",
 type="inverse")
acinv2a <- autocov_dist(columbus$CRIME, xy, nbs=10, style="B",
 type="inverse.squared")

plot(ac1a ~ columbus$CRIME, pch=16, asp=1)
points(acinva ~ columbus$CRIME, pch=16, col="red")
points(acinv2a ~ columbus$CRIME, pch=16, col="blue")
abline(0,1)

nb <- dnearneigh(xy, 0, 10)
lw <- nb2listw(nb, style="B")
ac1b <- lag(lw, columbus$CRIME)
all.equal(ac1b, ac1a)

nbd <- nbdists(nb, xy)
gl <- lapply(nbd, function(x) 1/x)
lw <- nb2listw(nb, glist=gl)
acinvb <- lag(lw, columbus$CRIME)
all.equal(acinvb, acinva)

gl2 <- lapply(nbd, function(x) 1/(x^2))
lw <- nb2listw(nb, glist=gl2)
acinv2b <- lag(lw, columbus$CRIME)
all.equal(acinv2b, acinv2a)

glm(CRIME ~ HOVAL + ac1b, data=columbus, family="gaussian")
spautolm(columbus$CRIME ~ HOVAL, data=columbus,
 listw=nb2listw(nb, style="W"))

xy <- SpatialPoints(xy)
acinva <- autocov_dist(columbus$CRIME, xy, nbs=10, style="W",
 type="inverse")
nb <- dnearneigh(xy, 0, 10)
nbd <- nbdists(nb, xy)
gl <- lapply(nbd, function(x) 1/x)
lw <- nb2listw(nb, glist=gl)
acinvb <- lag(lw, columbus$CRIME)
all.equal(acinvb, acinva)
}



