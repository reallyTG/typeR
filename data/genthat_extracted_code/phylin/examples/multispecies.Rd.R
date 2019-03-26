library(phylin)


### Name: multispecies
### Title: Summarizes data from multiple species.
### Aliases: multispecies
### Keywords: idw interpolation

### ** Examples

data(vipers)
data(d.gen)
data(grid)

# create a matrix of distances from sample points (columns) to all
# grid pixels
rd <- real.dist(vipers[,1:2], grid)

#interpolate with idw
result <- intgen.idw(rd, d.gen)

ms <- multispecies(result)

# plot the mean
grid.image(ms, grid, main = "Mean")

# plot the standard deviation
grid.image(ms, grid, ic=2, main = "Standard Deviation")



