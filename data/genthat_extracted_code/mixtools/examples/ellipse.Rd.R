library(mixtools)


### Name: ellipse
### Title: Draw Two-Dimensional Ellipse Based on Mean and Covariance
### Aliases: ellipse
### Keywords: file

### ** Examples

## Produce a 95% ellipse with the specified mean and covariance structure. 

mu <- c(1, 3)
sigma <- matrix(c(1, .3, .3, 1.5), 2, 2)

ellipse(mu, sigma, npoints = 200, newplot = TRUE)
 



