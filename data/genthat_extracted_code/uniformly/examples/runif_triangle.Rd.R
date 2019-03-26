library(uniformly)


### Name: runif_triangle
### Title: Uniform sampling on/in a triangle
### Aliases: runif_triangle runif_in_triangle runif_on_triangle

### ** Examples

sims <- runif_on_triangle(30, c(0,0), c(1,0), c(0,1))
plot(sims, xlim=c(0,1), ylim=c(0,1), pch=19)
sims <- runif_in_triangle(100, c(0,0), c(1,0), c(0,1))
plot(sims, xlim=c(0,1), ylim=c(0,1), pch=19)



