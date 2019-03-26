library(spatstat)


### Name: Gres
### Title: Residual G Function
### Aliases: Gres
### Keywords: spatial models

### ** Examples

    data(cells)
    fit0 <- ppm(cells, ~1) # uniform Poisson
    G0 <- Gres(fit0)
    plot(G0)
# Hanisch correction estimate
    plot(G0, hres ~ r)
# uniform Poisson is clearly not correct

    fit1 <- ppm(cells, ~1, Strauss(0.08))
    plot(Gres(fit1), hres ~ r)
# fit looks approximately OK; try adjusting interaction distance

    plot(Gres(cells, interaction=Strauss(0.12)))

# How to make envelopes
    ## Not run: 
##D     E <- envelope(fit1, Gres, model=fit1, nsim=39)
##D     plot(E)
##D     
## End(Not run)
# For computational efficiency
    Gc <- Gcom(fit1)
    G1 <- Gres(Gc)



