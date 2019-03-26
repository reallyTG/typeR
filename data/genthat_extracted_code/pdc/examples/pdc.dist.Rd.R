library(pdc)


### Name: pdcDist
### Title: Permutation Distribution Clustering Distance Matrix
### Aliases: pdc.dist pdcDist

### ** Examples


# create a set of time series consisting
# of sine waves with different degrees of added noise
# and two white noise time series
X <- cbind(
sin(1:500)+rnorm(500,0,.1),
sin(1:500)+rnorm(500,0,.2),
sin(1:500)+rnorm(500,0,.3),
sin(1:500)+rnorm(500,0,.4),
rnorm(500,0,1),
rnorm(500,0,1)
)

# calculate the distance matrix
D <- pdcDist(X,3)

# and plot with lattice package, you will
# be able to spot two clusters: a noise cluster
# and a sine wave cluster
require("lattice")
levelplot(as.matrix(D), col.regions=grey.colors(100,start=0.9, end=0.3))





