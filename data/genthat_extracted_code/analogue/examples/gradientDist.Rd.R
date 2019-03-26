library(analogue)


### Name: gradientDist
### Title: Positions of samples along a unit-length ordination gradient.
### Aliases: gradientDist gradientDist.default gradientDist.cca
###   gradientDist.prcurve
### Keywords: multivariate utility

### ** Examples


data(abernethy)

## Remove the Depth and Age variables
abernethy2 <- abernethy[, -(37:38)]

## Fit PCA
aber.pca <- rda(abernethy2)

## Distance along the first PCA axis
gradientDist(aber.pca)



