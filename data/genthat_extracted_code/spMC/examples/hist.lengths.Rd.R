library(spMC)


### Name: hist.lengths
### Title: Histograms of Stratum Lengths for Each Observed Category
### Aliases: hist.lengths
### Keywords: spatial distribution hplot

### ** Examples
## No test: 
data(ACM)
direction <- c(0,0,1)
     
# Compute the appertaining directional line for each location
loc.id <- which_lines(ACM[, 1:3], direction)
     
# Estimate stratum lengths
gl <- getlen(ACM$MAT3, ACM[, 1:3], loc.id, direction)

# Plot the histograms
hist(gl)
## End(No test)


