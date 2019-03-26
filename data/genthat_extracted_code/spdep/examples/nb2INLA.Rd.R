library(spdep)


### Name: nb2INLA
### Title: Output spatial neighbours for INLA
### Aliases: nb2INLA
### Keywords: spatial

### ** Examples

if (require(rgdal, quietly=TRUE)) {
example(columbus, package="spData")
td <- tempdir()
x <- nb2INLA(paste(td, "columbus-INLA.adj", sep="/"), col.gal.nb)
}



