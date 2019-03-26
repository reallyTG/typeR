library(mclust)


### Name: priorControl
### Title: Conjugate Prior for Gaussian Mixtures.
### Aliases: priorControl
### Keywords: cluster

### ** Examples

# default prior
irisBIC <- mclustBIC(iris[,-5], prior = priorControl())
summary(irisBIC, iris[,-5])

# no prior on the mean; default prior on variance
irisBIC <- mclustBIC(iris[,-5], prior = priorControl(shrinkage = 0))
summary(irisBIC, iris[,-5])



