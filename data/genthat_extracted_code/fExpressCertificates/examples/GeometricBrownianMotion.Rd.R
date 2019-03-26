library(fExpressCertificates)


### Name: GeometricBrownianMotion
### Title: Simulate paths from a Arithmetic or Geometric Brownian Motion
### Aliases: GBM GeometricBrownianMotion BM BrownianMotion
###   ArtihmeticBrownianMotion GeometricBrownianMotionMatrix
### Keywords: math

### ** Examples

# Simulate three trajectories of the Geometric Brownian Motion S(t)
T        <- 1
mc.steps <- 100
dt       <- T/mc.steps
t        <- seq(0, T, by=dt)
S_t      <- GBM(S0=100, mu=0.05, sigma=0.3, T=T, N=mc.steps)
plot(t, S_t, type="l", main="Sample paths of the Geometric Brownian Motion")
for (i in 1:2) {
 S_t      <- GBM(S0=100, mu=0.05, sigma=0.3, T=T, N=mc.steps)
 lines(t, S_t, type="l")
}



