library(spMC)


### Name: getlen
### Title: Estimation of Stratum Lengths for Embedded Markov Chain
### Aliases: getlen
### Keywords: spatial

### ** Examples
## No test: 
data(ACM)
direction <- c(0,0,1)

# Compute the appertaining directional line for each location
loc.id <- which_lines(ACM[, 1:3], direction)

# Estimate stratum lengths
gl <- getlen(ACM$MAT5, ACM[, 1:3], loc.id, direction)
## End(No test)


