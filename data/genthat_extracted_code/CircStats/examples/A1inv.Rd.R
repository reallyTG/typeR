library(CircStats)


### Name: A1inv
### Title: Inverse of A1
### Aliases: A1inv
### Keywords: math

### ** Examples

#Generate data from a von Mises distribution
data <- rvm(50, pi, 4)
#Estimate the concentration parameter
s <- sum(sin(data))
c <- sum(cos(data))
mean.dir <- atan2(s, c)
kappa <- A1inv(mean(cos(data - mean.dir)))



