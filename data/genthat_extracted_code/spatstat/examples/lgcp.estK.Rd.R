library(spatstat)


### Name: lgcp.estK
### Title: Fit a Log-Gaussian Cox Point Process by Minimum Contrast
### Aliases: lgcp.estK
### Keywords: spatial models

### ** Examples

    if(interactive()) {
      u <- lgcp.estK(redwood)
    } else {
      # slightly faster - better starting point
      u <- lgcp.estK(redwood, c(var=1, scale=0.1))
    }
    u
    plot(u)

    ## Don't show: 
      if(require(RandomFields)) {
        K <- Kest(redwood, r=seq(0, 0.1, length=9))
        op <- spatstat.options(fastK.lgcp=TRUE)
        lgcp.estK(K, covmodel=list(model="matern", nu=0.3),
                  control=list(maxit=2))
        spatstat.options(op)
      }
    
## End(Don't show)
    if(FALSE) {
      ## takes several minutes!
      lgcp.estK(redwood, covmodel=list(model="matern", nu=0.3))
    }



