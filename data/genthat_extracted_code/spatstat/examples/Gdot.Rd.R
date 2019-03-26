library(spatstat)


### Name: Gdot
### Title: Multitype Nearest Neighbour Distance Function (i-to-any)
### Aliases: Gdot
### Keywords: spatial nonparametric

### ** Examples

    # amacrine cells data
    G0. <- Gdot(amacrine, "off") 
    plot(G0.)

    # synthetic example    
    pp <- runifpoispp(30)
    pp <- pp %mark% factor(sample(0:1, npoints(pp), replace=TRUE))
    G <- Gdot(pp, "0")
    G <- Gdot(pp, 0) # equivalent



