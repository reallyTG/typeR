library(stabm)


### Name: plotFeatures
### Title: Plot Selected Features
### Aliases: plotFeatures

### ** Examples

feats = list(1:3, 1:4, 1:5)
mat = 0.92 ^ abs(outer(1:10, 1:10, "-"))
plotFeatures(features = feats)
plotFeatures(features = feats, sim.mat = mat)



