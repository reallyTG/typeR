library(spdep)


### Name: nb2WB
### Title: Output spatial weights for WinBUGS
### Aliases: nb2WB listw2WB
### Keywords: spatial

### ** Examples

if (require(rgdal, quietly=TRUE)) {
example(columbus, package="spData")
x <- nb2WB(col.gal.nb)
dput(x, control=NULL)
x <- listw2WB(nb2listw(col.gal.nb))
dput(x, control=NULL)
}



