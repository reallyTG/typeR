library(cit)


### Name: cit.cp
### Title: Causal Inference Test for a Continuous Outcome
### Aliases: cit.cp
### Keywords: nonparametric

### ** Examples

# Sample Size
ss = 100

# Errors
e1 = matrix(rnorm(ss),ncol=1)
e2 = matrix(rnorm(ss),ncol=1)

# Simulate genotypes, gene expression, covariates, and clinical trait matrices
L = matrix(rbinom(ss*3,2,.5),ncol=3)
G =  matrix( apply(.3*L, 1, sum) + e1,ncol=1)
T =  matrix(.3*G + e2,ncol=1)
C =  matrix(matrix(rnorm(ss*2),ncol=1),ncol=2)

n.perm = 5
perm.index = matrix(NA, nrow=ss, ncol=n.perm )
for( j in 1:ncol(perm.index) ) perm.index[, j] = sample( 1:ss )

results = cit.cp(L, G, T)
results

results = cit.cp(L, G, T, perm.index=perm.index, n.perm=5)
results

results = cit.cp(L, G, T, C)
results

results = cit.cp(L, G, T, C, n.perm=5)
results



