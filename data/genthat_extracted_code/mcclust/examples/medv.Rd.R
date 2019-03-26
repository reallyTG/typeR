library(mcclust)


### Name: medv
### Title: Clustering Method of Medvedovic
### Aliases: medv
### Keywords: cluster

### ** Examples

data(cls.draw1.5) 
# sample of 500 clusterings from a Bayesian cluster model 
tru.class <- rep(1:8,each=50) 
# the true grouping of the observations
psm1.5 <- comp.psm(cls.draw1.5)
medv1.5 <- medv(psm1.5)
table(medv1.5, tru.class)





