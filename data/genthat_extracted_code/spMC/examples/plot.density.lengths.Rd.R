library(spMC)


### Name: plot.density.lengths
### Title: Plot Empirical Densities Estimates of Stratum Lengths
### Aliases: plot.density.lengths
### Keywords: spatial distribution hplot

### ** Examples
## No test: 
data(ACM)
direction <- c(0,0,1)
     
# Compute the appertaining directional line for each location
loc.id <- which_lines(ACM[, 1:3], direction)
     
# Estimate stratum lengths
gl <- getlen(ACM$MAT3, ACM[, 1:3], loc.id, direction)

# Compute the empirical densities of stratum log-lengths
dgl <- density(gl, log = TRUE)

# Plot the empirical densities of stratum log-lengths
plot(dgl)
## End(No test)


