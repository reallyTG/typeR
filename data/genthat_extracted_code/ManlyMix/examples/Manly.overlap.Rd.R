library(ManlyMix)


### Name: Manly.overlap
### Title: Estimates the overlap for a Manly mixture
### Aliases: Manly.overlap
### Keywords: Manly mixture Overlap

### ** Examples

set.seed(123)
#sets the number of components, dimensionality and sample size
K <- 3
p <- 2

#sets the mixture parameters
tau <- c(0.25, 0.3, 0.45)
Mu <- matrix(c(4.5,4,5,7,8,5.5),3)
la <- matrix(c(0.2,0.5,0.3,0.25,0.35,0.4),3)
S <- array(NA, dim = c(p,p,K))
S[,,1] <- matrix(c(0.4,0,0,0.4),2)
S[,,2] <- matrix(c(1,-0.2,-0.2,0.6),2)
S[,,3] <- matrix(c(2,-1,-1,2),2)

#computes the overlap
A <- Manly.overlap(tau, Mu, S, la)
print(A)



