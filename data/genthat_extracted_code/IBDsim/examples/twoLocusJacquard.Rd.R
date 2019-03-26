library(IBDsim)


### Name: twoLocusJacquard
### Title: Estimating two-locus Jacquard coefficients
### Aliases: twoLocusJacquard
### Keywords: math

### ** Examples

### Siblings whose parents are full siblings.
x = fullSibMating(generations=2)
Nsim = 100 # (increase to improve accuracy) 

# Estimate of the 9 identity coefficients
j_est = oneLocusJacquard(x, ind1=5, ind2=6, Nsim=Nsim, seed=123)

### Two-locus Jacquard coefficients
# Completely linked loci
rho = 0 
j2_linked = twoLocusJacquard(x, ind1=5, ind2=6, rho=rho, Nsim=Nsim, seed=123)
stopifnot(identical(diag(j2_linked), j_est))

# Completely unlinked
rho = 0.5
j2_unlinked = twoLocusJacquard(x, ind1=5, ind2=6, rho=rho, Nsim=Nsim, seed=123)
stopifnot(identical(j2_unlinked, outer(j_est, j_est)))



