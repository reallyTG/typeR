library(spMC)


### Name: is.lengths
### Title: Object test for lengths class
### Aliases: is.lengths
### Keywords: spatial attribute

### ** Examples
## No test: 
data(ACM)
direction <- c(0,0,1)
     
# Compute the appertaining directional line for each location
loc.id <- which_lines(ACM[, 1:3], direction)
     
# Estimate stratum lengths
gl <- getlen(ACM$MAT3, ACM[, 1:3], loc.id, direction)

# Test the object gl
is.lengths(gl)

## End(No test)


