library(spatstat)


### Name: thomas.estpcf
### Title: Fit the Thomas Point Process by Minimum Contrast
### Aliases: thomas.estpcf
### Keywords: spatial models

### ** Examples

    data(redwood)
    u <- thomas.estpcf(redwood, c(kappa=10, scale=0.1))
    u
    plot(u, legendpos="topright")
    u2 <- thomas.estpcf(redwood, c(kappa=10, scale=0.1),
          pcfargs=list(stoyan=0.12))



