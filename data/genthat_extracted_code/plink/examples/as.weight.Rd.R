library(plink)


### Name: as.weight
### Title: Calibration Weights
### Aliases: as.weight
### Keywords: misc

### ** Examples

###### Unidimensional Examples ######
# Create a set of 40 (default) theta values and uniform weights
wt <- as.weight()

# Create a set of 40 quadrature points and weights using a standard 
# normal distribution
wt <- as.weight(quadrature=TRUE)

# Create a set of 30 quadrature points and weights using a normal 
# distribution with a mean of 0.5
wt <- as.weight(n=30, quadrature=TRUE, mu=0.5)

# Create weights for a set of random normal theta values
wt <- as.weight(theta=rnorm(100))

# Create an object with equal interval theta values and standard 
# normal density weights
wt <- as.weight(theta=seq(-4,4,0.05), normal.wt=TRUE)

# Create an object with equal interval theta values and normal 
# density weights with a mean of 0.5 and SD equal to .92
wt <- as.weight(theta=seq(-4,4,0.05), normal.wt=TRUE, mean=0.5, sd=0.92)

###### Multidimensional Examples ######
# Create a set of 49 theta values and uniform weights 
# (based on seven points for each dimension)
wt <- as.weight(dimensions=2)

# Create a set of 100 quadrature points and weights using a normal 
# distribution with a means of 0 and 0.5 for the two dimensions respectively
wt <- as.weight(n=10, quadrature=TRUE, mu=c(0,0.5), dimensions=2)

# Create an object with equal interval theta values and standard 
# normal density weights for three dimensions
wt <- as.weight(theta=seq(-3,3), normal.wt=TRUE, dimensions=3)

# Create an object with two sets of equal interval theta values for 
# two dimensions
wt <- as.weight(theta=list(seq(-4,4),seq(-3,3)), dimensions=2)

# Create an object with two sets of random normal theta values and 
# standard normal density weights for two dimensions
wt <- as.weight(theta=list(rnorm(10),rnorm(10)), normal.wt=TRUE, dimensions=2)



