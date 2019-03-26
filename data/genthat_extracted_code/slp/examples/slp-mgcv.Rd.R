library(slp)


### Name: slp.mgcv
### Title: Generate a Basis Matrix for Discrete Prolate Spheroidal
###   (Slepian) Sequences
### Aliases: slp.mgcv smooth.construct.slp.smooth.spec slp.smooth.spec
### Keywords: models smooth regression Slepian mgcv

### ** Examples

    # Examples using pkg:mgcv
    library("mgcv")
    library("slp")

    N <- 730
    W <- 8 / N
    K <- 16         # will actually use 15 df as intercept = FALSE
    x <- rnorm(n = N, sd = 1)
    y <- x + rnorm(n = N, sd = 2) + 5.0
    t <- seq(1, N)    

    # note: all three examples share identical results

    # example with in-call computation, using K (df)
    fit1 <- gam(y ~ x + s(t, bs = 'slp', xt = list(K = K)), family = gaussian) 

    # example with in-call computation, using W
    fit2 <- gam(y ~ x + s(t, bs = 'slp', xt = list(W = W)), family = gaussian)




