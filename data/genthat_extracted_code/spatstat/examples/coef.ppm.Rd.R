library(spatstat)


### Name: coef.ppm
### Title: Coefficients of Fitted Point Process Model
### Aliases: coef.ppm
### Keywords: spatial models methods

### ** Examples

    data(cells)

    poi <- ppm(cells, ~1, Poisson())
    coef(poi)
    # This is the log of the fitted intensity of the Poisson process

    stra <- ppm(cells, ~1, Strauss(r=0.07))
    coef(stra)

    # The two entries "(Intercept)" and "Interaction"
    # are respectively log(beta) and log(gamma)
    # in the usual notation for Strauss(beta, gamma, r)




