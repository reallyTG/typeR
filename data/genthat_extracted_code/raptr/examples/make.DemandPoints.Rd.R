library(raptr)


### Name: make.DemandPoints
### Title: Generate demand points for RAP
### Aliases: make.DemandPoints

### ** Examples

# set random number generator seed
set.seed(500)

# load data
data(cs_spp, cs_space)

# generate species points
species.points <- randomPoints(cs_spp[[1]], n = 100, prob = TRUE)
env.points <- raster::extract(cs_space, species.points)

# generate demand points for a 1d space using ks
dps1 <- make.DemandPoints(points = env.points[, 1], kernel.method = "ks")

# print object
print(dps1)

## No test: 
# generate demand points for a 2d space using hypervolume
dps2 <- make.DemandPoints(points = env.points,
                          kernel.method = "hypervolume",
                          samples.per.point = 50,
                          verbose = FALSE)

# print object
print(dps2)
## End(No test)



