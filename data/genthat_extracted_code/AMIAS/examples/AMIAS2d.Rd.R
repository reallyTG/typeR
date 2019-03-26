library(AMIAS)


### Name: AMIAS2d
### Title: Alternating Minimization Induced Active Set Algorithms(2d)
### Aliases: AMIAS2d

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
  y <- matrix(y,10,10)

  AMIAS2d(y, D_type = "fused.2d")



