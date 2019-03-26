library(metaBMA)


### Name: meta_bma
### Title: Model Averaging for Meta-Analysis
### Aliases: meta_bma

### ** Examples

data(towels)
mb <- meta_bma(towels$logOR, towels$SE, towels$study,
               d = "norm", d.par = c(0,.3),
               tau = "halfcauchy", tau.par = .5,
               sample = 0, summarize = "none")
               # (no summary: only for CRAN checks)
mb
plot_posterior(mb, "d")



