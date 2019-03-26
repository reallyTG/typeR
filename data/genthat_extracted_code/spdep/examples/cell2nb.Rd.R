library(spdep)


### Name: cell2nb
### Title: Generate neighbours list for grid cells
### Aliases: cell2nb mrc2vi rookcell queencell vi2mrc
### Keywords: spatial

### ** Examples

nb7rt <- cell2nb(7, 7)
summary(nb7rt)
xyc <- attr(nb7rt, "region.id")
xy <- matrix(as.integer(unlist(strsplit(xyc, ":"))), ncol=2, byrow=TRUE)
plot(nb7rt, xy)
nb7rt <- cell2nb(7, 7, torus=TRUE)
summary(nb7rt)



