library(geomorph)


### Name: bilat.symmetry
### Title: Analysis of bilateral symmetry
### Aliases: bilat.symmetry
### Keywords: analysis

### ** Examples

#Example of matching symmetry

data(mosquito)
gdf <- geomorph.data.frame(wingshape = mosquito$wingshape, ind=mosquito$ind, side=mosquito$side,
replicate=mosquito$replicate)
mosquito.sym <- bilat.symmetry(A = wingshape, ind = ind, side = side,
replicate = replicate, object.sym = FALSE, RRPP = TRUE, iter = 499, data = gdf)
summary(mosquito.sym)
plot(mosquito.sym, warpgrids = TRUE)
mosquito.sym$shape.anova # extract just the anova table on shape

# Previous example, performing GPA first
Y.gpa <- gpagen(mosquito$wingshape)
mosquito.sym2 <- bilat.symmetry(A = Y.gpa, ind = ind, side = side,
replicate = replicate, object.sym = FALSE, RRPP = TRUE, iter = 499, data = gdf)
summary(mosquito.sym2)
summary(mosquito.sym) # same results

#Example of object symmetry

data(scallops)
gdf <- geomorph.data.frame(shape = scallops$coorddata, ind=scallops$ind)
scallop.sym <- bilat.symmetry(A = shape, ind = ind, object.sym = TRUE, 
land.pairs=scallops$land.pairs, data = gdf, RRPP = TRUE, iter = 499)
summary(scallop.sym)

# Previous example, incorporating semilandmarks

scallop.sym <- bilat.symmetry(A = shape, ind = ind, object.sym = TRUE, 
curves= scallops$curvslide, surfaces = scallops$surfslide,
land.pairs=scallops$land.pairs, data = gdf, RRPP = TRUE, iter = 499)
summary(scallop.sym)
# NOTE one can also: plot(scallop.sym, warpgrids = TRUE, mesh = NULL)
# NOTE one can also: scallop.sym$data.type # recall the symmetry type



