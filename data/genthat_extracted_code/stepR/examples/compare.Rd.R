library(stepR)


### Name: compareBlocks
### Title: Compare fit blockwise with ground truth
### Aliases: compareBlocks
### Keywords: nonparametric

### ** Examples

# simulate two Gaussian hidden Markov models of length 1000 with 2 states each
# with identical transition rates being 0.01 and 0.05, resp, signal-to-noise ratio is 5
sim <- lapply(c(0.01, 0.05), function(rate)
  contMC(1e3, 0:1, matrix(c(0, rate, rate, 0), 2), param=1/5))
plot(sim[[1]]$data)
lines(sim[[1]]$cont, col="red")
# use smuceR to estimate fit
fit <- lapply(sim, function(s) smuceR(s$data$y, s$data$x))
lines(fit[[1]], col="blue")
# compare fit with (discretised) ground truth
compareBlocks(lapply(sim, function(s) s$discr), fit)



