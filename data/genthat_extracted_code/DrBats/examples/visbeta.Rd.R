library(DrBats)


### Name: visbeta
### Title: Format scores output for visualization
### Aliases: visbeta

### ** Examples

data("toydata")
data("stanfit")
codafit <- coda.obj(stanfit) ## convert to mcmc.list
beta.res <- visbeta(codafit, Y = toydata$Y.simul$Y, D = toydata$wlu$D, chain = 1,
axes = c(1, 2), quant = c(0.05, 0.95))

ggplot2::ggplot() +
  ggplot2::geom_path(data = beta.res$contour.df, ggplot2::aes(x = x, y = y, colour = ind)) +
  ggplot2::geom_point(data = beta.res$mean.df, ggplot2::aes(x = x, y = y, colour = ind))




