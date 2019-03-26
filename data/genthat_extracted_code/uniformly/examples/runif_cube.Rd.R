library(uniformly)


### Name: runif_cube
### Title: Uniform sampling on/in cube
### Aliases: runif_cube runif_in_cube runif_on_cube

### ** Examples

sims <- runif_on_cube(60, d=2)
plot(sims, xlim=c(-1,1), ylim=c(-1,1), pch=19, asp=1)
## No test: 
sims <- runif_in_cube(50, d=3)
library(scatterplot3d)
scatterplot3d(sims, pch=19, highlight.3d=TRUE, asp=1)
## End(No test)



