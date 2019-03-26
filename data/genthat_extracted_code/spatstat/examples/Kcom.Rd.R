library(spatstat)


### Name: Kcom
### Title: Model Compensator of K Function
### Aliases: Kcom
### Keywords: spatial models

### ** Examples

    fit0 <- ppm(cells, ~1) # uniform Poisson
    ## Don't show: 
fit0 <- ppm(cells, ~1, nd=16)
## End(Don't show)

    if(interactive()) {
      plot(Kcom(fit0))
# compare the isotropic-correction estimates
      plot(Kcom(fit0), cbind(iso, icom) ~ r)
# uniform Poisson is clearly not correct
    }

    fit1 <- ppm(cells, ~1, Strauss(0.08))
    ## Don't show: 
fit1 <- ppm(cells, ~1, Strauss(0.08), nd=16)
## End(Don't show)
    K1 <- Kcom(fit1)
    K1
    if(interactive()) {
      plot(K1)
      plot(K1, cbind(iso, icom) ~ r)
      plot(K1, cbind(trans, tcom) ~ r)
# how to plot the difference between nonparametric estimates and compensators
      plot(K1, iso - icom ~ r)
# fit looks approximately OK; try adjusting interaction distance
    }
    fit2 <- ppm(cells, ~1, Strauss(0.12))
    ## Don't show: 
fit2 <- ppm(cells, ~1, Strauss(0.12), nd=16)
## End(Don't show)
    K2 <- Kcom(fit2)
    if(interactive()) {
      plot(K2)
      plot(K2, cbind(iso, icom) ~ r)
      plot(K2, iso - icom ~ r)
    }



