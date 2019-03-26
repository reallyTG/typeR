library(plotGMM)


### Name: plot_mix_comps
### Title: Plot a Mixture Component
### Aliases: plot_mix_comps

### ** Examples

set.seed(1)
mixmdl <- mixtools::normalmixEM(faithful$waiting, k = 2)
x <- mixmdl$x
x <- data.frame(x)
ggplot2::ggplot(data.frame(x)) +
  ggplot2::geom_histogram(ggplot2::aes(x, ..density..)) +
  ggplot2::stat_function(geom = "line", fun = plot_mix_comps,
                args = list(mixmdl$mu[1], mixmdl$sigma[1], lam = mixmdl$lambda[1]),
                colour = "red") +
  ggplot2::stat_function(geom = "line", fun = plot_mix_comps,
                args = list(mixmdl$mu[2], mixmdl$sigma[2], lam = mixmdl$lambda[2]),
               colour = "blue")



