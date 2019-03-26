library(mixlink)


### Name: Mixture Link Binomial Distribution
### Title: Distribution functions
### Aliases: 'Mixture Link Binomial Distribution' r.mixlink.binom 'Mixture
###   Link Binomial Distribution' d.mixlink.binom 'Mixture Link Binomial
###   Distribution' p.mixlink.binom

### ** Examples

  mean.true <- 1/3
  Pi.true <- c(1/5, 4/5)
  kappa.true <- 0.5
  m <- 10
  r.mixlink.binom(n = 30, mean.true, Pi.true, kappa.true, m)
  d.mixlink.binom(y = 5, m, mean.true, Pi.true, kappa.true)
  d.mixlink.binom(y = 5, m, mean.true, Pi.true, kappa.true, log = TRUE)
  p.mixlink.binom(y = 5, m, mean.true, Pi.true, kappa.true)



