library(yuima)


### Name: Diagnostic.Carma
### Title: Diagnostic Carma model
### Aliases: Diagnostic.Carma
### Keywords: ~kwd1 ~kwd2

### ** Examples


mod1 <- setCarma(p = 2, q = 1, scale.par = "sig",
          Carma.var = "y")

param1 <- list(a1 = 1.39631, a2 = 0.05029, b0 = 1,
            b1 = 1, sig = 1)
samp1 <- setSampling(Terminal = 100, n = 200)

set.seed(123)

sim1 <- simulate(mod1, true.parameter = param1,
          sampling = samp1)

est1 <- qmle(sim1, start = param1)

Diagnostic.Carma(est1)




