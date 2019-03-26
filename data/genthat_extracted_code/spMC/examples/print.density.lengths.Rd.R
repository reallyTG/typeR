library(spMC)


### Name: print.density.lengths
### Title: Printing Empirical Densities Estimates of Stratum Lengths
### Aliases: print.density.lengths
### Keywords: spatial distribution

### ** Examples
## No test: 
data(ACM)
direction <- c(0,0,1)
     
# Compute the appartaining directional line for each location
loc.id <- which_lines(ACM[, 1:3], direction)
     
# Estimate stratum lengths
gl <- getlen(ACM$MAT3, ACM[, 1:3], loc.id, direction)

# Compute the empirical densities of stratum lengths
dgl <- density(gl)

# Print the empirical densities of stratum lengths
print(dgl)
## End(No test)


