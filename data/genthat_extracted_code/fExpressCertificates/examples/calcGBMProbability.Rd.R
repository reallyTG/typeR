library(fExpressCertificates)


### Name: calcGBMProbability
### Title: Calculates probabilities for the Geometric Brownian Motion
### Aliases: calculateProbabilityGeometricBrownianMotion calcGBMProbability
### Keywords: math

### ** Examples

# Simulate paths for Geometric Brownian Motion and compute barrier probabilities
N=400
S <- matrix(NA,1000,N+1)
for (i in 1:1000) {
  S[i,] <- GBM(S0=100, mu=0.05, sigma=1, T=1, N=N)
}

# a) Maximum M_t
M_t <- apply(S, 1, max, na.rm=TRUE)

S0 <- 100
B  <- seq(100, 1000, by=1)

p1 <- calcGBMProbability(Type="P(M_t <= B)", S0=S0, B=B, t=1, mu=0.05, sigma=1)

# or via arithmetic Brownian Motion and drift mu - sigma^2/2
p2 <- calcBMProbability(Type="P(M_t <= a)", a=log(B/S0), t=1, mu=0.05-1/2, sigma=1)

plot(ecdf(M_t))
lines(B, p1, col="red", lwd=2)
lines(B, p2, col="green")

# b) Minimum m_t
m_t <- apply(S, 1, min, na.rm=TRUE)

B  <- seq(0, 100, by=1)
p3 <- calcGBMProbability(Type="P(m_t <= B)", S0=S0, B=B, t=1, mu=0.05, sigma=1)
p4 <- calcBMProbability(Type="P(m_t <= a)", a=log(B/S0), t=1, mu=0.05-1/2, sigma=1)

plot(ecdf(m_t))
lines(B, p3, col="red", lwd=2)
lines(B, p4, col="green", lty=2)



