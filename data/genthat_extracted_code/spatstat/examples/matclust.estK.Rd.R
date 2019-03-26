library(spatstat)


### Name: matclust.estK
### Title: Fit the Matern Cluster Point Process by Minimum Contrast
### Aliases: matclust.estK
### Keywords: spatial models

### ** Examples

    data(redwood)
    u <- matclust.estK(redwood, c(kappa=10, scale=0.1))
    u
    plot(u)



