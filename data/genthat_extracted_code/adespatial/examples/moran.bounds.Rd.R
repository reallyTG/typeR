library(adespatial)


### Name: moran.bounds
### Title: Function to compute extreme values of Moran's I
### Aliases: moran.bounds
### Keywords: spatial

### ** Examples


if(require("ade4", quietly = TRUE)){
 if(require("spdep", quietly = TRUE)){
     data(oribatid)
     nbtri <- tri2nb(as.matrix(oribatid$xy))
     lwB <- nb2listw(nbtri, style = "B")
     lwW <- nb2listw(nbtri, style = "W")
     scB <- mem(lwB)
     scW <- mem(lwW)
     moran.bounds(lwB)
     moran.mc(scB[,1], lwB, 9)
     moran.mc(scB[,69], lwB, 9)
     moran.bounds(lwW)
     moran.mc(scW[,1], lwW, 9)
     moran.mc(scW[,69], lwW, 9)
 }
}




