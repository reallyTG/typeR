library(adespatial)


### Name: orthobasis.poly
### Title: Function to compute polynomial of geographical coordinates
### Aliases: orthobasis.poly
### Keywords: spatial

### ** Examples


if(require("ade4", quietly = TRUE)){
data(mafragh, package = "ade4")
pol2 <- orthobasis.poly(mafragh$Spatial) 

if(require("adegraphics", quietly = TRUE)){
plot(pol2, mafragh$Spatial)
}
}





