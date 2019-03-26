library(LCMCR)


### Name: lcmCR
### Title: Bayesian Nonparametric Latent Class Capture-Recapture
### Aliases: lcmCR
### Keywords: capture-recapture

### ** Examples

require('LCMCR')
data(kosovo_aggregate)
sampler <- lcmCR(captures = kosovo_aggregate, tabular = FALSE, in_list_label = '1',
  not_in_list_label = '0', K = 10, a_alpha = 0.25, b_alpha = 0.25,
  seed = 'auto', buffer_size = 10000, thinning = 100)
sampler
N <- lcmCR_PostSampl(sampler, burnin = 10000, samples = 1000, thinning = 100)
quantile(N, c(0.025, 0.5, 0.975))



