library(ETAS)


### Name: etas
### Title: Fit the space-time ETAS model to data
### Aliases: etas
### Keywords: spatial math earthquake modeling

### ** Examples

  # fitting the ETAS model to an Iranian catalog
  # preparing the catalog
  iran.cat <- catalog(iran.quakes, time.begin="1973/01/01",
     study.start="1986/01/01", study.end="2016/01/01",
     lat.range=c(26, 40), long.range=c(44, 63), mag.threshold=5)
  print(iran.cat)
  ## Not run: 
##D   plot(iran.cat)
## End(Not run)

  # setting initial parameter values
  param0 <- c(0.46, 0.23, 0.022, 2.8, 1.12, 0.012, 2.4, 0.35)

  # fitting the model
  ## Not run: 
##D   iran.fit <- etas(iran.cat, param0=param0)
## End(Not run)


  # fitting the ETAS model to an Italian catalog
  # preparing the catalog
  italy.cat <- catalog(italy.quakes, dist.unit="km")
  ## Not run: 
##D   plot(italy.cat)
## End(Not run)

  # setting initial parameter values
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

  # fitting the model
  ## Not run: 
##D   nthreads <- parallel::detectCores()
##D   italy.fit <- etas(italy.cat, param0, nthreads=nthreads)
## End(Not run)


  # fitting the ETAS model to a Japanese catalog
  # setting the target polygonal study region
  jpoly <- list(long=c(134.0, 137.9, 143.1, 144.9, 147.8,
      137.8, 137.4, 135.1, 130.6), lat=c(31.9, 33.0, 33.2,
      35.2, 41.3, 44.2, 40.2, 38.0, 35.4))
  # preparing the catalog
  japan.cat <- catalog(japan.quakes, study.start="1953-05-26",
      study.end="1990-01-08", region.poly=jpoly, mag.threshold=4.5)
  ## Not run: 
##D   plot(japan.cat)
## End(Not run)

  # setting initial parameter values
  param0 <- c(0.592844590, 0.204288231, 0.022692883, 1.495169224,
  1.109752319, 0.001175925, 1.860044210, 1.041549634)

  # fitting the model
  ## Not run: 
##D   nthreads <- parallel::detectCores()
##D   japan.fit <- etas(japan.cat, param0, nthreads=nthreads)
## End(Not run)



