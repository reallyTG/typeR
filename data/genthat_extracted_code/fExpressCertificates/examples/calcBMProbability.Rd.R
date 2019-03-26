library(fExpressCertificates)


### Encoding: UTF-8

### Name: calcBMProbability
### Title: Calculates probabilities for the Arithmetic Brownian Motion
### Aliases: calculateProbabilityBrownianMotion
###   calcBrownianMotionProbability calcBMProbability
### Keywords: math

### ** Examples

################################################################################
#
# Example 1: Maximum M_t of Brownian motion
#
################################################################################

# simulate 1000 discretized paths from Brownian Motion B_t
B <- matrix(NA,1000,101)
for (i in 1:1000) {
  B[i,] <- BrownianMotion(S0=100, mu=0.05, sigma=1, T=1, N=100)
}

# get empirical Maximum M_t
M_t <- apply(B, 1, max, na.rm=TRUE)
plot(density(M_t, from=100))

# empirical CDF of M_t
plot(ecdf(M_t))
a <- seq(100, 103, by=0.1)
# P(M_t <= a)
# 1-cdf.M_t(a-100, t=1, mu=0.05, sigma=1)
p <- calcBMProbability(Type = "P(M_t <= a)", a-100, t = 1, 
    mu = 0.05, sigma = 1)
lines(a, p, col="red")

################################################################################
#
# Example 2: Minimum m_t of Brownian motion
#
################################################################################

# Minimum m_t : Drift ändern von 0.05 auf -0.05
m_t <- apply(B, 1, min, na.rm=TRUE)

a <- seq(97, 100, by=0.1)
# cdf.m_t(a-100, t=1, mu=0.05, sigma=1)
p <- calcBMProbability(Type = "P(m_t <= a)", a-100, t = 1, mu = 0.05, sigma = 1)

plot(ecdf(m_t))
lines(a, p, col="blue")



