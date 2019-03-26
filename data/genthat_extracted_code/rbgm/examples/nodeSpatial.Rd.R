library(rbgm)


### Name: nodeSpatial
### Title: Vertices as Spatial points.
### Aliases: nodeSpatial pointSpatial

### ** Examples

fname <- bgmfiles::bgmfiles(pattern = "antarctica_28")
bgm <- bgmfile(fname)
spnode <- nodeSpatial(bgm)
names(spnode)
nrow(spnode)  ## only unique vertices
nrow(bgm$vertices)

sppoints <- pointSpatial(bgm)
names(sppoints)
nrow(sppoints)



