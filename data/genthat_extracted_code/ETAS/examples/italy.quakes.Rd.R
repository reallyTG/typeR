library(ETAS)


### Name: italy.quakes
### Title: An Italian Earthquake Catalog
### Aliases: italy.quakes
### Keywords: datasets spatial earthquak

### ** Examples

  # creat an earthquake catalog
  italy.cat <- catalog(italy.quakes, dist.unit="km")

  ## Not run: 
##D   plot(italy.cat)
## End(Not run)

  # set initial parameter values
  mu <- 1
  k0 <- 0.005
  c <- 0.005
  alpha <- 1.05
  p <- 1.01
  D <- 1.1
  q <- 1.52
  gamma <- 0.6
  # reparametrization: transform k0 to A
  A <- pi * k0 / ((p - 1) * c^(p - 1) * (q - 1) * D^(q - 1))
  param0 <- c(mu, A, c, alpha, p, D, q, gamma)

  ## Not run: 
##D   italy.fit <- etas(italy.cat, param0)
## End(Not run)



