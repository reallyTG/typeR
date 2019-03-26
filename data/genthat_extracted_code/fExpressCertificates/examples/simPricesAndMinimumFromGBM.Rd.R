library(fExpressCertificates)


### Name: simPricesAndMinimumFromGBM
### Title: Simulation of the joint finite-dimensional distribution of the
###   Geometric Brownian Motion and its minimum
### Aliases: simPricesAndMinimumFromGBM simPricesAndMinimumFromGBM2
### Keywords: multivariate

### ** Examples

# Comparison of sampling of GBM Minimum m_t via finite dimensional approach +
# Brownian Bridges vs. crude Monte Carlo

# naive grid-based approach
X0 <- simPricesAndMinimumFromGBM2(N=5000, S=100, T=c(1,2,3), mu = 0.05, sigma=0.3, 
  mc.steps=1000)

# Simulation of minimums m_t via prices at valuation dates 
# (S(t_1),S(t_2),...,S(t_n)) and Brownian Bridges in-between	
X1 <- simPricesAndMinimumFromGBM(N=5000, S=100, T=c(1,2,3), mu=0.05, sigma=0.3)
m1 <- X1[,4]
  
# Monte Carlo simulation of m_t via gridpoints (m2)
mc.loops <- 5000
mc.steps <- 2000
S <- matrix(NA, mc.loops, mc.steps + 1)
for (j in 1:mc.loops) {
 S[j,] <- GBM(S0=100, mu=0.05, sigma=0.3, T=3, N=mc.steps)
}	
m2 <- apply(S, 1, min) # minimum for each price path
  
# Compare probability density function and CDF for m_t against each other
# and against theoretical CDF.
par(mfrow=c(2,2))
# a) pdf of GBM minimum m_t at maturity for both approaches
plot(density(m1, to=100), col="black")
lines(density(m2, to=100), col="blue")
  
# b) compare empirical CDFs for m_t with theoretical probability P(m_t <= B)
B  <- seq(0, 100, by=1)
p3 <- calcGBMProbability(Type="P(m_t <= B)", 
  S0=100, B=B, t=3, mu=0.05, sigma=0.3)
  
plot(ecdf(m1), col="black", main="Sampling of GBM minimum m_t")
lines(ecdf(m2), col="blue")
lines(B, p3, col="red")
legend("topleft", legend=c("Finite-dimensions and Brownian Bridge", 
   "MC Euler scheme", "Theoretical value"), 
   col=c("black","blue","red"), lwd=2) 



