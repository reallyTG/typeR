library(mixlink)


### Name: Mixture Link Poisson Distribution
### Title: Distribution functions
### Aliases: 'Mixture Link Poisson Distribution' r.mixlink.pois 'Mixture
###   Link Poisson Distribution' d.mixlink.pois 'Mixture Link Poisson
###   Distribution' p.mixlink.pois

### ** Examples

  mean.true <- 20
  Pi.true <- c(1/4, 3/4)
  kappa.true <- 0.5
  r.mixlink.pois(n = 30, mean.true, Pi.true, kappa.true)
  d.mixlink.pois(y = 21, mean.true, Pi.true, kappa.true)
  d.mixlink.pois(y = 21, mean.true, Pi.true, kappa.true, log = TRUE)
  p.mixlink.pois(y = 21, mean.true, Pi.true, kappa.true)




