library(adespatial)


### Name: scalogram
### Title: Function to compute a scalogram
### Aliases: scalogram plot.scalogram
### Keywords: spatial

### ** Examples

if(require("ade4", quietly = TRUE) & require("spdep", quietly = TRUE)){
data(mafragh)
me <- mem(nb2listw(mafragh$nb))

if(require("adegraphics", quietly = TRUE)){
sc1 <- scalogram(mafragh$env$Conduc, me, nblocks = 10)
plot(sc1) 
}
}
 



