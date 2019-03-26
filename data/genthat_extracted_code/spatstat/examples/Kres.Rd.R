library(spatstat)


### Name: Kres
### Title: Residual K Function
### Aliases: Kres
### Keywords: spatial models

### ** Examples

    data(cells)
    fit0 <- ppm(cells, ~1) # uniform Poisson
    ## Don't show: 
    fit0 <- ppm(cells, ~1, nd=16)
## End(Don't show)
    K0 <- Kres(fit0)
    K0
    plot(K0)
# isotropic-correction estimate
    plot(K0, ires ~ r)
# uniform Poisson is clearly not correct

    fit1 <- ppm(cells, ~1, Strauss(0.08))
    ## Don't show: 
fit1 <- ppm(cells, ~1, Strauss(0.08), nd=16)
## End(Don't show)
    K1 <- Kres(fit1)

    if(interactive()) {
      plot(K1, ires ~ r)
   # fit looks approximately OK; try adjusting interaction distance
      plot(Kres(cells, interaction=Strauss(0.12)))
    }

# How to make envelopes
    ## Not run: 
##D     E <- envelope(fit1, Kres, model=fit1, nsim=19)
##D     plot(E)
##D     
## End(Not run)

# For computational efficiency
    Kc <- Kcom(fit1)
    K1 <- Kres(Kc)



