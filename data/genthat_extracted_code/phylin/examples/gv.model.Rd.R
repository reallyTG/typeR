library(phylin)


### Name: gv.model
### Title: Fit a model to the semi-variogram.
### Aliases: gv.model
### Keywords: variogram kriging

### ** Examples


data(vipers)
data(d.gen)

# create a distance matrix between samples
r.dist <- dist(vipers[,1:2])

# fit a variogram with defaults (shperical model) and estimation of range
gv <- gen.variogram(r.dist, d.gen)
gv <- gv.model(gv)

# plot variogram
plot(gv)

# fit a new variogram with linear with sill model and range 8
gv2 <- gv.model(gv, model='linear', range=8)
plot(gv2)




