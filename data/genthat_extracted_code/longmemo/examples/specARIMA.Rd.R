library(longmemo)


### Name: specARIMA
### Title: Spectral Density of Fractional ARMA Process
### Aliases: specARIMA
### Keywords: ts models

### ** Examples

 str(r.7  <- specARIMA(0.7, m = 256, p = 0, q = 0))
 str(r.5  <- specARIMA(eta = c(H = 0.5, phi=c(-.06, 0.42, -0.36), psi=0.776),
                       m = 256, p = 3, q = 1))
 plot(r.7)
 plot(r.5)



