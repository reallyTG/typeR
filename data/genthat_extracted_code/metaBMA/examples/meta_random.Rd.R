library(metaBMA)


### Name: meta_random
### Title: Bayesian Random-Effects Meta-Analysis
### Aliases: meta_random

### ** Examples

data(towels)
### Bayesian Random-Effects Meta-Analysis
mr <- meta_random(towels$logOR, towels$SE, towels$study,
                  d = "norm", d.par = c(0,.3),
                  tau = "halfcauchy", tau.par = .5,
                  sample = 0, summarize = "none")
                  # (no summary: only for CRAN checks)
mr
plot_posterior(mr)



