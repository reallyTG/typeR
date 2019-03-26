library(mixtools)


### Name: compCDF
### Title: Plot the Component CDF
### Aliases: compCDF
### Keywords: file

### ** Examples

## The sulfur content of the coal seams in Texas

set.seed(100)

A <- c(1.51, 1.92, 1.08, 2.04, 2.14, 1.76, 1.17)
B <- c(1.69, 0.64, .9, 1.41, 1.01, .84, 1.28, 1.59) 
C <- c(1.56, 1.22, 1.32, 1.39, 1.33, 1.54, 1.04, 2.25, 1.49) 
D <- c(1.3, .75, 1.26, .69, .62, .9, 1.2, .32) 
E <- c(.73, .8, .9, 1.24, .82, .72, .57, 1.18, .54, 1.3)

dis.coal <- makemultdata(A, B, C, D, E, 
                         cuts = median(c(A, B, C, D, E)))
temp <- multmixEM(dis.coal)

## Now plot the components' CDF via the posterior probabilities

compCDF(dis.coal$x, temp$posterior, xlab="Sulfur", ylab="", main="empirical CDFs")



