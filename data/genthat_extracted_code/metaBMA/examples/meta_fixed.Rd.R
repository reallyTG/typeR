library(metaBMA)


### Name: meta_fixed
### Title: Bayesian Fixed-Effects Meta-Analysis
### Aliases: meta_fixed

### ** Examples

data(towels)
### Bayesian Fixed-Effects Meta-Analysis (H1: d>0 Cauchy)
mf <- meta_fixed(towels$logOR, towels$SE, towels$study,
                 d = "halfnorm", d.par = c(0, .3))
mf
plot_posterior(mf)
plot_forest(mf)



