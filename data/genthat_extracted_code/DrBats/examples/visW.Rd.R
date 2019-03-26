library(DrBats)


### Name: visW
### Title: Plot the estimates for the latent factors
### Aliases: visW

### ** Examples

data("toydata")
data("stanfit")
codafit <- coda.obj(stanfit) ## convert to mcmc.list
W.res <- visW(codafit, Y = toydata$Y.simul$Y, D = toydata$wlu$D,
chain = 1, factors = c(1, 2))

## plot the results

data <- data.frame(time = rep(1:9, 2), W.res$res.W)
ggplot2::ggplot() +
  ggplot2::geom_step(data = data, ggplot2::aes(x = time, y = Estimation, colour = Factor)) +
  ggplot2::geom_step(data = data, ggplot2::aes(x = time, y = Lower.est, colour = Factor),
  linetype = "longdash") +
  ggplot2::geom_step(data = data, ggplot2::aes(x = time, y = Upper.est, colour = Factor),
  linetype = "longdash")




