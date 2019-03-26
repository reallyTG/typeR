library(spMC)


### Name: density.lengths
### Title: Empirical Densities Estimation of Stratum Lengths
### Aliases: density.lengths
### Keywords: spatial distribution

### ** Examples
## No test: 
data(ACM)
direction <- c(0,0,1)
     
# Compute the appertaining directional line for each location
loc.id <- which_lines(ACM[, 1:3], direction)
     
# Estimate stratum lengths
gl <- getlen(ACM$MAT3, ACM[, 1:3], loc.id, direction)

# Compute the empirical densities of stratum lengths
dgl <- density(gl)
## End(No test)


