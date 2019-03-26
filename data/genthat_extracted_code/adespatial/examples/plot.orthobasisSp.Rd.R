library(adespatial)


### Name: plot.orthobasisSp
### Title: Function to display Moran's Eigenvector Maps (MEM) and other
###   spatial orthogonal bases
### Aliases: plot.orthobasisSp

### ** Examples

if(require("ade4", quietly = TRUE) & require("spdep", quietly = TRUE)){
data(mafragh)
me <- mem(nb2listw(mafragh$nb))

if(require("adegraphics", quietly = TRUE)){
plot(me[,1:6], mafragh$xy)
plot(me[,1:6], mafragh$Spatial) 
}
}
        



