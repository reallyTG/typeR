library(trueskill)


### Name: Gaussian-class
### Title: Gaussian Class with args (mu, sigma) or (pi, tau)
### Aliases: Gaussian-class Gaussian *,Gaussian,Gaussian-method
###   /,Gaussian,Gaussian-method

### ** Examples

	 
  g0 <- Gaussian(pi = 0.05, tau = 0.13)	
	
  g1 <- Gaussian(mu = 25, sigma = 8)
  g2 <- Gaussian(30, 6)
  g3 <- Multiply(g1, g2)

  # these are equivalent
  Gaussian$new(25, 8)
  Gaussian$new(mu = 25, pi = 8)
  Gaussian(mu = 25, pi = 8) 
  Gaussian(25, 8) 
  
  # approximately the same
  Gaussian(pi = 0.016, tau = 0.391) 



