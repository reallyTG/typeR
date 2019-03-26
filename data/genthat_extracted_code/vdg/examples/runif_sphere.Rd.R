library(vdg)


### Name: runif_cube
### Title: Sampling for hyperspheres/hypercubes
### Aliases: runif_cube runif_sphere

### ** Examples


set.seed(1234)
runif_sphere(n = 10)

set.seed(1234)
samp <- runif_sphere(n = 500, at = TRUE)
plot(samp, asp = 1)



