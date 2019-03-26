library(bayesGARCH)


### Name: bayesGARCH
### Title: Bayesian Estimation of the GARCH(1,1) Model with Student-t
###   Innovations
### Aliases: bayesGARCH
### Keywords: models

### ** Examples

  ## !!! INCREASE THE NUMBER OF MCMC ITERATIONS !!!

  ## LOAD DATA
  data(dem2gbp)
  y <- dem2gbp[1:750]

  ## RUN THE SAMPLER (2 chains)
  MCMC <- bayesGARCH(y, control = list(n.chain = 2, l.chain = 200))

  ## MCMC ANALYSIS (using coda)
  plot(MCMC)
  
  ## FORM THE POSTERIOR SAMPLE
  smpl <- formSmpl(MCMC, l.bi = 50)

  ## POSTERIOR STATISTICS
  summary(smpl)
  smpl <- as.matrix(smpl)
  pairs(smpl)

  ## GARCH(1,1) WITH NORMAL INNOVATIONS
  MCMC <- bayesGARCH(y, lambda = 100, delta = 500,
                     control = list(n.chain = 2, l.chain = 200))

  ## GARCH(1,1) WITH NORMAL INNOVATIONS AND 
  ## WITH COVARIANCE STATIONARITY CONDITION
  addPriorConditions <- function(psi){psi[2] + psi[3] < 1}
  MCMC <- bayesGARCH(y, lambda = 100, delta = 500,
                     control = list(n.chain = 2, l.chain = 200, 
                     addPriorConditions = addPriorConditions))



