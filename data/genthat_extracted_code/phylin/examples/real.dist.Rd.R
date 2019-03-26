library(phylin)


### Name: real.dist
### Title: Real distance matrix for samples and interpolation locations.
### Aliases: real.dist
### Keywords: distance

### ** Examples

data(vipers)

# create a grid of the sampled area
grid <- expand.grid(x=seq(-10,10,0.5), y=seq(30, 50, 0.5))

rd <- real.dist(vipers[,1:2], grid)



