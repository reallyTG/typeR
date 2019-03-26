library(fitur)


### Name: plot_density
### Title: Density Comparison Plot
### Aliases: plot_density

### ** Examples

library(ggplot2)
set.seed(37)
x <- rgamma(10000, 5)
dists <- c('gamma', 'lnorm', 'weibull')
fits <- lapply(dists, fit_univariate, x = x)
plot_density(x, fits, 30) +
theme_bw()



