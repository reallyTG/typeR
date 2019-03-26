library(IBDsim)


### Name: oneLocusIBD
### Title: Estimating pairwise IBD coefficients
### Aliases: oneLocusIBD
### Keywords: math

### ** Examples

### Example 1: Full siblings
x <- nuclearPed(2) 
Nsim <- 100 # Should be increased substantially

# Autosomal kappa: Estimate vs exact 
k_est = oneLocusIBD(x, ind1=3, ind2=4, Nsim=Nsim, seed=123)
k_exact = c(0.25, 0.5, 0.25)
stopifnot(all(round(k_est - k_exact, 1) == 0))

# X-chromosomal kappa: Estimate vs exact 
k_est_X = oneLocusIBD(x, ind1=3, ind2=4, Nsim=Nsim, Xchrom=TRUE, seed=123)
k_exact_X = c(0.5, 0.5)
stopifnot(all(round(k_est - k_exact, 1) == 0))



