library(analogue)


### Name: varExpl
### Title: Variance explained by ordination axes
### Aliases: varExpl varExpl.default varExpl.cca varExpl.prcurve
### Keywords: multivariate utility

### ** Examples


data(abernethy)

## Remove the Depth and Age variables
abernethy2 <- abernethy[, -(37:38)]

## Fit PCA
aber.pca <- rda(abernethy2)

## Distance along the first PCA axis
varExpl(aber.pca)



