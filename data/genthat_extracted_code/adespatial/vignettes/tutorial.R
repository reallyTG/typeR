## ------------------------------------------------------------------------
library(adespatial)
library(ade4)
library(adegraphics)
library(spdep)
library(maptools)

## ---- echo = -1----------------------------------------------------------
data(mafragh)
class(mafragh$Spatial)
par(mar = c(0, 0, 3, 0))
xx <- poly2nb(mafragh$Spatial)
plot(mafragh$Spatial, border = "grey")
plot(xx, coordinates(mafragh$Spatial), add = TRUE, pch = 20, col = "red")
title(main="Neighborhood for polygons")

## ---- echo = -1----------------------------------------------------------
par(mar = rep(0,4))
xygrid <- expand.grid(x = 1:10, y = 1:8)
plot(xygrid, pch = 20, asp = 1)

## ---- echo = -1----------------------------------------------------------
par(mar = c(0, 0, 3, 0))

nb1 <- cell2nb(10, 8, type = "queen")

plot(nb1, xygrid, col = "red", pch = 20)
title(main = "Queen neighborhood")

nb1

## ---- echo = -1----------------------------------------------------------
par(mar = c(0, 0, 3, 0))
nb2 <- cell2nb(10, 8, type = "rook")

plot(nb2, xygrid, col = "red", pch = 20)
title(main = "Rook neighborhood")

nb2

## ---- echo = -1----------------------------------------------------------
par(mar = c(0, 0, 3, 0))
xytransect <- expand.grid(1:20, 1)
nb3 <- cell2nb(20, 1)

plot(nb3, xytransect, col = "red", pch = 20)
title(main = "Transect of 20 sites")

summary(nb3)

## ---- echo = -1----------------------------------------------------------
par(mar = c(0, 0, 3, 0))
set.seed(3)
xyir <- matrix(runif(20), 10, 2)
plot(xyir, pch = 20, main = "Irregular sampling with 10 sites")

## ---- fig.width = 5, echo = -1-------------------------------------------
par(mar = c(0, 0, 3, 0), mfrow = c(2, 2))
nbnear1 <- dnearneigh(xyir, 0, 0.2)
nbnear2 <- dnearneigh(xyir, 0, 0.3)
nbnear3 <- dnearneigh(xyir, 0, 0.5)
nbnear4 <- dnearneigh(xyir, 0, 1.5)

plot(nbnear1, xyir, col = "red", pch = 20)
title(main = "neighbors if 0<d<0.2")
plot(nbnear2, xyir, col = "red", pch = 20)
title(main = "neighbors if 0<d<0.3")
plot(nbnear3, xyir, col = "red", pch = 20)
title(main = "neighbors if 0<d<0.5")
plot(nbnear4, xyir, col = "red", pch = 20)
title(main = "neighbors if 0<d<1.5")

## ------------------------------------------------------------------------
nbnear1

## ------------------------------------------------------------------------
nbnear4

## ---- fig.width = 5, echo = -1-------------------------------------------
par(mar = c(0, 0, 3, 0), mfrow = c(1, 2))
knn1 <- knearneigh(xyir, k = 1)
nbknn1 <- knn2nb(knn1, sym = TRUE)
knn2 <- knearneigh(xyir, k = 2)
nbknn2 <- knn2nb(knn2, sym = TRUE)

plot(nbknn1, xyir, col = "red", pch = 20)
title(main = "Nearest neighbors (k=1)")
plot(nbknn2, xyir, col = "red", pch = 20)
title(main="Nearest neighbors (k=2)")

## ------------------------------------------------------------------------
n.comp.nb(nbknn1)
n.comp.nb(nbknn2)

## ---- fig.width = 5, echo = -1-------------------------------------------
par(mar = c(0, 0, 3, 0), mfrow = c(2, 2))
nbtri <- tri2nb(xyir)
nbgab <- graph2nb(gabrielneigh(xyir), sym = TRUE)
nbrel <- graph2nb(relativeneigh(xyir), sym = TRUE)
nbsoi <- graph2nb(soi.graph(nbtri, xyir), sym = TRUE)

plot(nbtri, xyir, col = "red", pch = 20)
title(main="Delaunay triangulation")
plot(nbgab, xyir, col = "red", pch = 20)
title(main = "Gabriel Graph")
plot(nbrel, xyir, col = "red", pch = 20)
title(main = "Relative Neighbor Graph")
plot(nbsoi, xyir, col = "red", pch = 20)
title(main = "Sphere of Influence Graph")

## ------------------------------------------------------------------------
nbgab[[1]]

## ------------------------------------------------------------------------
diffnb(nbsoi,nbrel)

## ------------------------------------------------------------------------
str(nbsoi)
str(include.self(nbsoi))

## ------------------------------------------------------------------------
nb2listw(nbgab)

## ------------------------------------------------------------------------
distgab <- nbdists(nbgab, xyir)
str(distgab)

## ------------------------------------------------------------------------
fdist <- lapply(distgab, function(x) 1-x/max(dist(xyir)))

## ------------------------------------------------------------------------
listwgab <- nb2listw(nbgab, glist = fdist, style = "B")
listwgab
names(listwgab)
listwgab$neighbours[[1]]
listwgab$weights[[1]]

## ------------------------------------------------------------------------
print(listw2mat(listwgab),digits=3)

## ------------------------------------------------------------------------
mem.gab <- mem(listwgab)
mem.gab

## ------------------------------------------------------------------------
str(mem.gab)

## ---- echo = -1----------------------------------------------------------
par(mar = c(0, 2, 3, 0))
    barplot(attr(mem.gab, "values"), 
        main = "Eigenvalues of the spatial weighting matrix", cex.main = 0.7)

## ------------------------------------------------------------------------
plot(mem.gab)

## ---- fig.width = 5, fig.height = 5--------------------------------------
plot(mem.gab, SpORcoords = xyir, nb = nbgab)

## ------------------------------------------------------------------------
moranI <- moran.randtest(mem.gab, listwgab, 99)
moranI

## ------------------------------------------------------------------------
attr(mem.gab, "values") / moranI$obs

## ---- fig.width = 5, fig.height = 5/3------------------------------------
signi <- which(moranI$p < 0.05)
signi
plot(mem.gab[,signi], SpORcoords = xyir, nb = nbgab)

