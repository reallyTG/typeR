library(fitur)


### Name: plot_qq
### Title: Q-Q Plot
### Aliases: plot_qq

### ** Examples

library(ggplot2)
set.seed(37)
x <- rgamma(10000, 5)
dists <- c('gamma', 'lnorm', 'weibull')
fits <- lapply(dists, fit_univariate, x = x)
plot_qq(x, fits) +
theme_bw()



