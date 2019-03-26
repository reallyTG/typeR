library(spatstat)


### Name: reach
### Title: Interaction Distance of a Point Process
### Aliases: reach reach.ppm reach.interact reach.fii reach.rmhmodel
### Keywords: spatial models

### ** Examples

    reach(Poisson())
    # returns 0

    reach(Strauss(r=7))
    # returns 7
    fit <- ppm(swedishpines ~ 1, Strauss(r=7))
    reach(fit)
    # returns 7

    reach(OrdThresh(42))
    # returns Inf
    
    reach(MultiStrauss(matrix(c(1,3,3,1),2,2)))
    # returns 3



