library(CircStats)


### Name: watson
### Title: Watson's Test
### Aliases: watson
### Keywords: htest

### ** Examples

# Generate data from the uniform distribution on the circle.
data <- runif(100, 0, 2*pi)  
watson(data)
# Generate data from a von Mises distribution.
data <- rvm(50, 0, 4) 
watson(data, 0.05, dist='vm')



