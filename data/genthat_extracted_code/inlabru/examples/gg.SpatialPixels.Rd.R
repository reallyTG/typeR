library(inlabru)


### Name: gg.SpatialPixels
### Title: Geom for SpatialPixels objects
### Aliases: gg.SpatialPixels

### ** Examples


# Load Gorilla data

data(gorillas)

# Turn elevation covariate into SpatialPixels
pxl = SpatialPixels(SpatialPoints(gorillas$gcov$elevation))

# Plot the pixel centers
ggplot() + gg(pxl, size = 0.1)



