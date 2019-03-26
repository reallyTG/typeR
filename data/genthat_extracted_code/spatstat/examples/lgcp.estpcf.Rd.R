library(spatstat)


### Name: lgcp.estpcf
### Title: Fit a Log-Gaussian Cox Point Process by Minimum Contrast
### Aliases: lgcp.estpcf
### Keywords: spatial models

### ** Examples

    data(redwood)
    u <- lgcp.estpcf(redwood, c(var=1, scale=0.1))
    u
    plot(u)
    if(require(RandomFields)) {
      lgcp.estpcf(redwood, covmodel=list(model="matern", nu=0.3))
    }



