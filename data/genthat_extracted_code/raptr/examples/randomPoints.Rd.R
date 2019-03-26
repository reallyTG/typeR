library(raptr)


### Name: randomPoints
### Title: Sample random points from a RasterLayer
### Aliases: randomPoints

### ** Examples

# simulate data
sim_pus <- sim.pus(225L)
sim_spp <- sim.species(sim_pus, model = "normal", n = 1, res = 0.25)

# generate points
pts1 <- randomPoints(sim_spp, n = 5)
pts2 <- randomPoints(sim_spp, n = 5, prob = TRUE)

# plot points
plot(sim_spp)
points(pts1, col = "red")
points(pts2, col = "black")




