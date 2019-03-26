library(matlib)


### Name: regvec3d
### Title: Vector space representation of a two-variable regression model
### Aliases: regvec3d regvec3d.formula regvec3d.default

### ** Examples

library(rgl)
therapy.vec <- regvec3d(therapy ~ perstest + IE, data=therapy)
therapy.vec
plot(therapy.vec, col.plane="darkgreen")
plot(therapy.vec, dimension=2)



