library(specklestar)


### Name: speckle_generator
### Title: Speckle Generator
### Aliases: speckle_generator

### ** Examples

speckle_vector <- speckle_generator(rho = 0.5, theta = 70,
dm = 0.3, seeing = 20, speckle_sigma = 1, wind = 0)
speckle_matrix <- matrix(speckle_vector, nrow = 512, ncol = 512)



