library(fitur)


### Name: plot_pp
### Title: P-P Plot
### Aliases: plot_pp

### ** Examples

library(ggplot2)
set.seed(37)
x <- rgamma(10000, 5)
dists <- c('gamma', 'lnorm', 'weibull')
fits <- lapply(dists, fit_univariate, x = x)
plot_pp(x, fits) +
theme_bw()



