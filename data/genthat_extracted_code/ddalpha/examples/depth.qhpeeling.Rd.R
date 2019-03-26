library(ddalpha)


### Name: depth.qhpeeling
### Title: Calculate Convex Hull Peeling Depth
### Aliases: depth.qhpeeling
### Keywords: robust multivariate nonparametric

### ** Examples

# Mixture of 3-variate normal distributions
data <- mvrnorm(25, rep(0, 3), diag(3))
x <- rbind(mvrnorm(10, rep(1, 3), diag(3)), data)
depths <- depth.qhpeeling(x, data)
cat("Depths:", depths, "\n")



