library(spatstat)


### Name: coef.mppm
### Title: Coefficients of Point Process Model Fitted to Multiple Point
###   Patterns
### Aliases: coef.mppm
### Keywords: spatial methods models

### ** Examples

    H <- hyperframe(X=waterstriders)

    fit.Poisson <- mppm(X ~ 1, H)
    coef(fit.Poisson)

    # The single entry "(Intercept)" 
    # is the log of the fitted intensity of the Poisson process

    fit.Strauss <- mppm(X~1, H, Strauss(7))
    coef(fit.Strauss)

    # The two entries "(Intercept)" and "Interaction"
    # are respectively log(beta) and log(gamma)
    # in the usual notation for Strauss(beta, gamma, r)

    # Tweak data to exaggerate differences
    H$X[[1]] <- rthin(H$X[[1]], 0.3)
    # Model with random effects
    fitran <- mppm(X ~ 1, H, random=~1|id)
    coef(fitran)



