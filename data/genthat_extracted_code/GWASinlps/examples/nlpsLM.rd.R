library(GWASinlps)


### Name: nlpsLM
### Title: Nonlocal prior based single-step SNP selection for Genome-wide
###   association study data with continuous phenotype
### Aliases: nlpsLM

### ** Examples

p = 1000; n = 100
m = 10
# Generate SNP genotype matrix
set.seed(1) 
f = runif( p, .1, .2 ) # simulate minor allele frequency
x = matrix( nrow = n, ncol = p )
colnames(x) = 1:p
for(j in 1:p)
  x[,j] = rbinom( n, 2, f[j] )
# Generate data
causal_snps = sample( 1:p, m )
beta = rep( 0, p )
set.seed(1)
beta[causal_snps] = rnorm(m, mean = 0, sd = 2 )
y = x %*% beta + rnorm(n, 0, 1) 
# Fix scale parameter tau 
tau = 0.022
# Perform GWASinlps
out = nlpsLM(y, x, prior = "mom", tau = tau, k0 = 10, rxx = .5, niter = 10000, verbose = TRUE) 
out



