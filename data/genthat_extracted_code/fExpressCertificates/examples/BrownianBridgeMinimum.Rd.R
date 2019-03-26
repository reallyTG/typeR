library(fExpressCertificates)


### Name: Distribution of the Brownian Bridge Minimum
### Title: Distribution of the Minimum of a Brownian Bridge
### Aliases: rBrownianBridgeMinimum dBrownianBridgeMinimum
### Keywords: math

### ** Examples

  # simulate 1000 samples from minimum distribution
  m <- rBrownianBridgeMinimum(n = 1000, t0 = 0, T = 1, a = 0.2, b = 0, sigma = 2)
    
  # and compare against the density
  x  <- seq(-6, 0, by=0.01)
  dm <- dBrownianBridgeMinimum(x, t0 = 0, T = 1, a = 0.2, b = 0, sigma = 2)
  
  plot(density(m))
  lines(x, dm, lty=2, col="red")



