library(metaBMA)


### Name: bma
### Title: Bayesian Model Averaging
### Aliases: bma

### ** Examples

data(towels)
fix1 <- meta_fixed(towels$logOR, towels$SE, towels$study,
                   d = "halfnorm", d.par = c(mean=0, sd=.2))
fix2 <- meta_fixed(towels$logOR, towels$SE, towels$study,
                   d = "beta", d.par = c(alpha=1, beta=1))
fix3 <- meta_fixed(towels$logOR, towels$SE, towels$study,
                   d = "triangular",
                   d.par = c(min=0, peak=.3, max=1))

averaged <- bma(list(Halfnormal = fix1, Uniform = fix2,
                     Triangular = fix3))
averaged
plot_posterior(averaged)
plot_forest(averaged, mar = c(4.5,20,4,.3))



