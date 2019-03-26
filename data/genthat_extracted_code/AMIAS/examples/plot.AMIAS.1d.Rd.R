library(AMIAS)


### Name: plot.AMIAS.1d
### Title: plot observe data with fitted value for AMIAS model
### Aliases: plot.AMIAS.1d

### ** Examples

  library(AMIAS)

  set.seed(12580)
  n <- 100
  sigma <- 0.3
  y0 <- rep(0,n)
  y0[10:15] <- 2
  y0[40:60] <- -1
  y0[80:82] <- 4
  y <- y0 + sigma*rnorm(n)
  y[80:82] <- y0[80:82] + sigma*rnorm(3)
  object <- AMIAS(y, h=1, outer_itermax=5)
  plot(object)



