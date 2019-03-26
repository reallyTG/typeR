library(mdsdt)


### Name: GOF
### Title: Conduct goodness of fit tests
### Aliases: GOF

### ** Examples

data(thomas01a)
fit1 <- fit.grt(thomas01a)
fit2 <- fit.grt(thomas01a, PI = 'same_rho')

# Take the model with the lower AIC
GOF(fit1, teststat = 'AIC')
GOF(fit2, teststat = 'AIC')



