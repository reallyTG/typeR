library(klaR)


### Name: trigrid
### Title: Barycentric plots
### Aliases: trigrid
### Keywords: aplot

### ** Examples

triplot(grid = FALSE)
trigrid(c(1/3, 0.5)) # same grid for all 3 dimensions 

triplot(grid = c(1/3, 0.5))  # (same effect) 

triplot(grid = FALSE)
# different grids for all dimensions:
trigrid(x = 1/3, y = 0.5, z = seq(0.2, 0.8, by=0.2))  

triplot(grid = FALSE)
# grid for third dimension only:
trigrid(x = NA, y = NA, z = c(0.1, 0.2, 0.4, 0.8))  



