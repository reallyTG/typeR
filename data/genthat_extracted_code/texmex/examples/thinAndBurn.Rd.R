library(texmex)


### Name: thinAndBurn
### Title: Process Metropolis output from extreme value model fitting to
###   discard unwanted observations.
### Aliases: thinAndBurn thinAndBurn.evmSim

### ** Examples


  x <- rnorm(1000)
  # For the values of burn and thin below, we should do many more iterations.
  # The number of iterations is kept low here due to the run time allowed
  # by CRAN.
  mod <- evm(x, qu=.7, method="sim", iter=11000)
  mod
  par(mfrow=c(3, 2))
  plot(mod)
  mod1 <- thinAndBurn(mod,burn=1000, thin=5)
  plot(mod1)




