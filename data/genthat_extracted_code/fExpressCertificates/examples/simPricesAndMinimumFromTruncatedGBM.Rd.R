library(fExpressCertificates)


### Name: simPricesAndMinimumFromTruncatedGBM
### Title: Simulation of the joint finite-dimensional distribution of a
###   restricted Geometric Brownian Motion and its minimum
### Aliases: simPricesAndMinimumFromTruncatedGBM
### Keywords: math multivariate

### ** Examples

# 1. Simulation of restricted GBM prices and minimums m_t
# finite-dimensional distribution and Brownian Bridge
X1 <- simPricesAndMinimumFromTruncatedGBM(N=5000, S=100, T=c(1,2,3), 
  upperX=c(100,100,Inf), mu=0.05, sigma=0.3)
m1 <- X1[,4]
  
# 2. Compare to distribution of unrestricted GBM minimums
X2 <- simPricesAndMinimumFromGBM(N=5000, S=100, T=c(1,2,3), 
  mu=0.05, sigma=0.3)
m2 <- X2[,4]
	
plot(density(m1, to=100), col="black", main="Minimum m_t for Express Certificate 
  price paths at maturity")
lines(density(m2, to=100), col="blue")
legend("topleft", legend=c("Restricted GBM minimum","Unrestricted GBM minimum"),
  col=c("black","blue"), lty=1, bty="n")



