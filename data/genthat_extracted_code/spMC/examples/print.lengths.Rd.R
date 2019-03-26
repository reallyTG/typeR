library(spMC)


### Name: print.lengths
### Title: Printing Stratum Lengths for Each Observed Category
### Aliases: print.lengths
### Keywords: spatial

### ** Examples
## No test: 
data(ACM)
direction <- c(0,0,1)
     
# Compute the appertaining directional line for each location
loc.id <- which_lines(ACM[, 1:3], direction)
     
# Estimate stratum lengths
gl <- getlen(ACM$MAT3, ACM[, 1:3], loc.id, direction)

# Print stratum lengths
print(gl)
## End(No test)


