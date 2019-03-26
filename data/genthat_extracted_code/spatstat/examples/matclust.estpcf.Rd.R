library(spatstat)


### Name: matclust.estpcf
### Title: Fit the Matern Cluster Point Process by Minimum Contrast Using
###   Pair Correlation
### Aliases: matclust.estpcf
### Keywords: spatial models

### ** Examples

    data(redwood)
    u <- matclust.estpcf(redwood, c(kappa=10, R=0.1))
    u
    plot(u, legendpos="topright")



