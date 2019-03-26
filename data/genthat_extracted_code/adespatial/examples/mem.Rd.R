library(adespatial)


### Name: scores.listw
### Title: Function to compute and manage Moran's Eigenvector Maps (MEM) of
###   a listw object
### Aliases: scores.listw mem orthobasis.listw [.orthobasisSp
### Keywords: spatial

### ** Examples


if(require("ade4", quietly = TRUE) & require("spdep", quietly = TRUE)){
data(oribatid)
nbtri <- tri2nb(as.matrix(oribatid$xy))
sc.tri <- scores.listw(nb2listw(nbtri, style = "B"))
summary(sc.tri)
}
if(require("adegraphics", quietly = TRUE)){
s.value(oribatid$xy,sc.tri[,1:9])
plot(sc.tri[,1:6], oribatid$xy, pSp.cex = 5, pSp.alpha = 0.5, pbackground.col = 'lightblue')
}




