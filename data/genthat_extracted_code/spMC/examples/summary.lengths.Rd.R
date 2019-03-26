library(spMC)


### Name: summary.lengths
### Title: Summarizing Stratum Lengths
### Aliases: summary.lengths
### Keywords: spatial distribution

### ** Examples
## No test: 
data(ACM)
direction <- c(0,0,1)
     
# Compute the appertaining directional line for each location
loc.id <- which_lines(ACM[, 1:3], direction)
     
# Estimate stratum lengths
gl <- getlen(ACM$MAT3, ACM[, 1:3], loc.id, direction)

# Summarize the stratum lengths
sgl <- summary(gl)
## End(No test)


