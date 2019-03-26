library(slp)


### Name: slp.gam
### Title: Generate a Basis Matrix for Discrete Prolate Spheroidal
###   (Slepian) Sequences
### Aliases: slp.gam slp
### Keywords: models smooth regression Slepian gam

### ** Examples

    # Examples using pkg:gam
    library("gam")
    library("slp")
    N <- 730
    W <- 14 / N
    K <- 28         # will actually use 27 df when intercept = FALSE
    x <- rnorm(n = N, sd = 1)
    y <- x + rnorm(n = N, sd = 2) + 5.0
    t <- seq(1, N)    

    # note: all three examples share identical results

    # example with in-call computation, using K (df)
    fit1 <- gam(y ~ x + slp(t, K = K, forceC = TRUE), family = gaussian) 

    # example with in-call computation, using W
    fit2 <- gam(y ~ x + slp(t, W = W, forceC = TRUE), family = gaussian)

    # example with out-of-call computation, using K
    timeBasis <- slp(t, K = K, forceC = TRUE)
    fit3 <- gam(y ~ x + timeBasis, family = gaussian)

    # the same computations can be done using pre-computed basis vectors
    # for significant speed-ups, especially for large N - see `checkSaved'
    # for more details
    fit4 <- gam(y ~ x + slp(t, W = W, forceC = FALSE))



