library(phylin)


### Name: summary.gv
### Title: Summary for 'gv' object
### Aliases: summary.gv
### Keywords: variogram kriging

### ** Examples

data(vipers)
data(d.gen)

# create a distance matrix between samples
r.dist <- dist(vipers[,1:2])

# fit a variogram with defaults (shperical model) and estimation of range
gv <- gen.variogram(r.dist, d.gen)

#plot semi-variogram
summary(gv)

# plot semi-variogram with model
gv <- gv.model(gv)
summary(gv)



