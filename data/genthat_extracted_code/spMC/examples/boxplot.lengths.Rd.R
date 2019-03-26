library(spMC)


### Name: boxplot.lengths
### Title: Stratum Lengths Boxplot
### Aliases: boxplot.lengths
### Keywords: spatial distribution hplot

### ** Examples
## No test: 
data(ACM)
direction <- c(0,0,1)

# Compute the appertaining directional line for each location
loc.id <- which_lines(ACM[, 1:3], direction)

# Estimate stratum lengths
gl <- getlen(ACM$MAT3, ACM[, 1:3], loc.id, direction)

# Make the boxplot of the object gl
## Don't show: 
par(mfrow = c(1, 1))
## End(Don't show)
boxplot(gl)
## End(No test)


