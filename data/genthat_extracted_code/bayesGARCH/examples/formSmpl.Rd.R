library(bayesGARCH)


### Name: formSmpl
### Title: Form the Posterior Sample
### Aliases: formSmpl
### Keywords: misc

### ** Examples

  ## !!! INCREASE THE NUMBER OF MCMC ITERATIONS !!!

  ## LOAD DATA SET
  data(dem2gbp)
  y <- dem2gbp[1:750]

  ## RUN THE ESTIMATION
  MCMC <- bayesGARCH(y, control = list(n.chain = 2, l.chain = 100))

  ## FORM THE SAMPLE FROM THE MCMC OUTPUT
  smpl <- formSmpl(MCMC, l.bi = 50, batch.size = 2)

  ## POSTERIOR STATISTICS
  summary(smpl)



