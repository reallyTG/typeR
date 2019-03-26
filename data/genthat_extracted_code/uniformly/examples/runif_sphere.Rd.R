library(uniformly)


### Name: runif_sphere
### Title: Uniform sampling on/in sphere
### Aliases: runif_sphere runif_on_sphere runif_in_sphere

### ** Examples

sims <- runif_on_sphere(20, d=2)
plot(sims, xlim=c(-1,1), ylim=c(-1,1), asp=1, pch=19)
sims <- runif_in_sphere(100, d=2)
plot(sims, xlim=c(-1,1), ylim=c(-1,1), asp=1, pch=19)



