library(diffeR)


### Name: memberships
### Title: produces membership values for each category in the input raster
###   at a specified aggregated resolution
### Aliases: memberships
### Keywords: spatial

### ** Examples

ref <- raster(system.file("external/reference.rst", package="diffeR"))
plot(ref)
memb.ref <- memberships(ref, fact=2)
names(memb.ref) <- c("ref.A", "ref.B", "ref.C")
plot(memb.ref)



