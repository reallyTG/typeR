library(spatstat)


### Name: Gcross
### Title: Multitype Nearest Neighbour Distance Function (i-to-j)
### Aliases: Gcross
### Keywords: spatial nonparametric

### ** Examples

    # amacrine cells data
    G01 <- Gcross(amacrine)

    # equivalent to:
    ## Not run: 
##D     G01 <- Gcross(amacrine, "off", "on")
##D     
## End(Not run)

    plot(G01)

    # empty space function of `on' points
    ## Not run: 
##D        F1 <- Fest(split(amacrine)$on, r = G01$r)
##D        lines(F1$r, F1$km, lty=3)
##D     
## End(Not run)

    # synthetic example    
    pp <- runifpoispp(30)
    pp <- pp %mark% factor(sample(0:1, npoints(pp), replace=TRUE))
    G <- Gcross(pp, "0", "1")   # note: "0" not 0



