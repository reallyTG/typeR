library(ManlyMix)


### Name: Manly.sim
### Title: Simulates Manly mixture dataset
### Aliases: Manly.sim
### Keywords: Manly mixture Data simulation

### ** Examples

set.seed(123)

#sets the number of components, dimensionality and sample size
K <- 3
p <- 2
n <- 1000

#sets the parameters to simulate data from 
tau <- c(0.25, 0.3, 0.45)
Mu <- matrix(c(12,4,4,12,4,10),3)
la <- matrix(c(1.2,0.5,1,0.5,0.5,0.7),3)
S <- array(NA, dim = c(p,p,K))
S[,,1] <- matrix(c(4,0,0,4),2)
S[,,2] <- matrix(c(5,-1,-1,3),2)
S[,,3] <- matrix(c(2,-1,-1,2),2)

#use function Manly.sim to simulate dataset with membership
A <- Manly.sim(n, la, tau, Mu, S)

#plot the data
plot(A$X, col = A$id)



