library(IBDsim)


### Name: oneLocusJacquard
### Title: Estimating Jacquard's condensed identity coefficients
### Aliases: oneLocusJacquard
### Keywords: math

### ** Examples

### Siblings whose parents are full siblings.
x = fullSibMating(generations=2)
Nsim = 100 # (increase to improve accuracy) 

# Estimating the 9 identity coefficients
j_est = oneLocusJacquard(x, ind1=5, ind2=6, Nsim=Nsim, seed=123)

# Exact values (requires the "identity" package)
## Not run: j_exact = jacquard(x, 5:6)

j_exact = c(2,1,4,1,4,1,7,10,2)/32

stopifnot(all(round(j_est - j_exact, 1) == 0))



