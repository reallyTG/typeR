library(phylin)


### Name: predict.gv
### Title: Predict method for 'gen.variogram' object with model.
### Aliases: predict.gv
### Keywords: predict variogram kriging

### ** Examples

data(vipers)
data(d.gen)

# create a grid of the sampled area for interpolation
grid <- expand.grid(x=seq(-10,10,0.5), y=seq(30, 50, 0.5))

# create a distance matrix between samples
r.dist <- dist(vipers[,1:2])

# fit a variogram with defaults (spherical model) and estimation of range
gv <- gen.variogram(r.dist, d.gen)
gv <- gv.model(gv)

all.dist <- as.matrix(dist(grid))

result <- predict(gv, all.dist)




