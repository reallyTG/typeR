library(spMC)


### Name: plot.hist.lengths
### Title: Plot Histograms of Stratum Lengths
### Aliases: plot.hist.lengths
### Keywords: spatial distribution hplot

### ** Examples
## No test: 
data(ACM)
direction <- c(0,0,1)
     
# Compute the appertaining directional line for each location
loc.id <- which_lines(ACM[, 1:3], direction)
     
# Estimate stratum lengths
gl <- getlen(ACM$MAT3, ACM[, 1:3], loc.id, direction)

# Compute the histograms
hgl <- hist(gl, plot = FALSE)

# Plot the histograms
plot(hgl, col = "#efffef")
## End(No test)


