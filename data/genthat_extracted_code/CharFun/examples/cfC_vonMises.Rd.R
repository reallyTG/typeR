library(CharFun)


### Name: cfC_vonMises
### Title: Characteristic function of von Mises distribution
### Aliases: cfC_vonMises

### ** Examples

# EXAMPLE1 (CF of the uniform von Mises distribution on (-pi,pi))
t <- seq(-10, 10, length.out = 501)
plotGraf(function(t)
  cfC_vonMises(t), t, title = "CF of the uniform von Mises distribution on (-pi,pi)")

# EXAMPLE2 (CF of the mixture of the von Mises distribution on (-pi,pi))
mu1 <- 0
kappa1 <- 5
mu2 <- 1
kappa2 <- 15
cf <-
  function(t)
    0.25 * cfC_vonMises(t, mu1, kappa1) + 0.75 * cfC_vonMises(t, mu2, kappa2)
t <- seq(-10, 10, length.out = 501)
plotGraf(cf, t, title = "CF of the mixture of the von Mises distribution")

# EXAMPLE3 (PDF/CDF of the von Mises distribution on (-pi,pi))
mu <- 0
kappa <- 5
cf  <- function(t)
  cfC_vonMises(t, mu, kappa)
result <- cf2DistGP(cf, xMin = -pi, xMax = pi)
angle <- result$x
radius <- result$pdf
plotPolar(angle, radius)

# EXAMPLE4 (PDF/CDF of the linear combinantion of 2 von Mises distribution on (-pi,pi))
mu1 <- 0
kappa1 <- 5
mu2 <- 1
kappa2 <- 15
cf <-
  function(t)
    cfC_vonMises(1 * t, mu1, kappa1) * cfC_vonMises(0.25 * t, mu2, kappa2)
result <- cf2DistGP(cf,
                    xMin = -pi,
                    xMax = pi,
                    isCircular = TRUE)
angle <- result$x
radius <- result$pdf
plotPolar(angle, radius)

# EXAMPLE5 (PDF/CDF of the mixture of the von Mises distribution on (0,2*pi))
mu1 <- 0
kappa1 <- 5
mu2 <- 1
kappa2 <- 15
mu3 <- pi
kappa3 <- 10
cf <-
  function(t)
    0.25 * cfC_vonMises(t, mu1, kappa1) + 0.25 * cfC_vonMises(t, mu2, kappa2) + 0.5 *
  cfC_vonMises(t, mu3, kappa3)
result <- cf2DistGP(cf,
                    xMin =  0,
                    xMax = 2 * pi,
                    isCircular = TRUE)
angle <- result$x
radius <- result$pdf
plotPolar(angle, radius)



