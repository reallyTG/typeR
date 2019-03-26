library(extRemes)


### Name: abba
### Title: Implementation of Stephenson-Shaby-Reich-Sullivan
### Aliases: abba abba_latent
### Keywords: models

### ** Examples

  dat <- matrix(-log(rexp(9 * 20)), nrow = 9, ncol = 20)
  sites <- cbind(rep(c(-1,0,1),3), rep(c(-1,0,1),each = 3))
  abba_latent(dat, sites, iters = 50, trace = 10)



