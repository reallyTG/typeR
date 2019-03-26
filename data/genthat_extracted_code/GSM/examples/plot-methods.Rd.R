library(GSM)


### Name: plot-methods
### Title: Plot of a Gamma Shape Mixture Model
### Aliases: plot-methods plot,ANY,ANY-method plot,gsm,missing-method
### Keywords: methods

### ** Examples

set.seed(2040)
y <- rgsm(500, c(.1, .3, .4, .2), 1)
burnin <- 5
mcmcsim <- 10
J <- 250
gsm.out <- estim.gsm(y, J, 300, burnin + mcmcsim, 6500, 340, 1/J)
par(mfrow = c(3, 2))
plot(gsm.out)
plot(gsm.out, ndens = 0, nbin = 20, start = (burnin + 1))
plot(gsm.out, ndens = 0, nbin = 20, histogram = TRUE, start = (burnin + 1))
plot(gsm.out, ndens = 0, nbin = 20, histogram = TRUE, bands = TRUE, start = (burnin + 1))
plot(gsm.out, ndens = 5, nbin = 20, histogram = TRUE, bands = TRUE, start = (burnin + 1))
plot(gsm.out, ndens = 0, nbin = 20, bands = TRUE, start = (burnin + 1))



