library(ecodist)


### Name: MRM
### Title: Multiple Regression on distance Matrices
### Aliases: MRM
### Keywords: multivariate

### ** Examples


data(graze)

# This grass is related to forest cover but not location
MRM(dist(LOAR10) ~ dist(sitelocation) + dist(forestpct), data=graze, nperm=100)

# This legume is related to location but not forest cover
MRM(dist(TRRE3) ~ dist(sitelocation) + dist(forestpct), data=graze, nperm=100)




