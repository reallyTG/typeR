library(spdep)


### Name: include.self
### Title: Include self in neighbours list
### Aliases: include.self
### Keywords: spatial

### ** Examples

if (require(rgdal, quietly=TRUE)) {
example(columbus, package="spData")
coords <- coordinates(columbus)
summary(col.gal.nb, coords)
summary(include.self(col.gal.nb), coords)
}



