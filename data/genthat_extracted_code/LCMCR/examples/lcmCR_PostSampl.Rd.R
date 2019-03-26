library(LCMCR)


### Name: lcmCR_PostSampl
### Title: Generate Samples from the Posterior Distribution of Population
###   Size under a LCMCR Model
### Aliases: lcmCR_PostSampl

### ** Examples

data(kosovo_aggregate)
sampler <- lcmCR(captures = kosovo_aggregate, tabular = FALSE, in_list_label = '1',
      not_in_list_label = '0', K = 10, a_alpha = 0.25, b_alpha = 0.25, seed = 'auto')
N <- lcmCR_PostSampl(sampler, burnin = 10000, samples = 1000, thinning = 100)
quantile(N, c(0.025, 0.5, 0.975))



