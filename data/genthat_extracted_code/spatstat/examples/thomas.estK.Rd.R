library(spatstat)


### Name: thomas.estK
### Title: Fit the Thomas Point Process by Minimum Contrast
### Aliases: thomas.estK
### Keywords: spatial models

### ** Examples

    data(redwood)
    u <- thomas.estK(redwood, c(kappa=10, scale=0.1))
    u
    plot(u)



