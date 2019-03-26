library(cpt)


### Name: cpt
### Title: Classification Permutation Test
### Aliases: cpt
### Keywords: multivariate

### ** Examples

## Create some simulated data
n = 50  # 50 observations
p = 5   # 5 covariates
T = rep(c(0,1),each=25)     # Two groups, 25 observations each
Z = matrix(rnorm(n*p),n,p)  # Random data (null is true)

## Run CPT
cpt.results = cpt(Z, T, class.methods="lda")
print(cpt.results$pval)

## False Null
Z[1:25, 1] = Z[1:25, 1] + 1  # Now the null is false 
cpt.results = cpt(Z, T, class.methods="lda")
print(cpt.results$pval)



