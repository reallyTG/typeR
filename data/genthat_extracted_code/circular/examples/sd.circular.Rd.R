library(circular)


### Name: sd.circular
### Title: Circular Standard Deviation
### Aliases: sd.circular
### Keywords: univar

### ** Examples

# Compute the circular standard deviation of a random
# sample of observations from a von Mises distribution
x <- rvonmises(n=100, mu=circular(0, units="degrees"), kappa=10)
sd(x)



