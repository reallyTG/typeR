library(phylin)


### Name: plot.gv
### Title: Plot a 'gv' object
### Aliases: plot.gv
### Keywords: variogram kriging

### ** Examples

data(vipers)
data(d.gen)

# create a distance matrix between samples
r.dist <- dist(vipers[,1:2])

# fit a variogram with defaults (shperical model) and estimation of range
gv <- gen.variogram(r.dist, d.gen, 0.25)

#plot semi-variogram
plot(gv)

# plot semi-variogram with model
gv <- gv.model(gv)
plot(gv)



