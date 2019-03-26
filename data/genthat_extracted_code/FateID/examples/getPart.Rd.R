library(FateID)


### Name: getPart
### Title: Inference of a cell type partition
### Aliases: getPart

### ** Examples

x <- intestine$x
y <- intestine$y

FMarker <- list(c("Defa20__chr8","Defa24__chr8"), "Clca3__chr3", "Alpi__chr1")
xf <- getPart(x,FMarker,fthr=NULL,n=5)




