library(asbio)


### Name: ci.p
### Title: Confidence interval estimation for the binomial parameter pi
###   using five popular methods.
### Aliases: ci.p
### Keywords: univar htest

### ** Examples

#In 2001, it was estimated that 56,200 Americans would be diagnosed with 
# non-Hodgkin's lymphoma and that 26,300 would die from it (Cernan et al. 2002).  
# Here we find the 95% confidence interval for the probability of diagnosis, pi. 

ci.p(c(rep(0, 56200-26300),rep(1,26300))) # Agresti-Coull
ci.p(c(rep(0, 56200-26300),rep(1,26300)), method = "LR") # Likelihood Ratio

# summarized = TRUE
n = 56200
x = 26300
phat = x/n

ci.p(summarized = TRUE, phat = phat, n = n) # Agresti-Coull

# Use 2001 US population size as N
N <- 285 * 10^6
ci.p(c(rep(0, 56200-26300),rep(1,26300)), fpc = TRUE, N = N) # Agresti-Coull
ci.p(summarized = TRUE, phat = phat, n = n, N = N, fpc = TRUE) # Agresti-Coull



