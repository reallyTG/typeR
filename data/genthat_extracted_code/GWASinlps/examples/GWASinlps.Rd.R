library(GWASinlps)


### Name: GWASinlps
### Title: Nonlocal prior based iterative SNP selection for Genome-wide
###   association study data
### Aliases: GWASinlps

### ** Examples

p = 1000; n = 200
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
tau = 0.2

# Perform GWASinlps
inlps = GWASinlps(y, x, prior = "mom", tau = tau, k0 = 1, m = 50, 
        rxx = .2)
cat( "GWASinlps selected", length(inlps), "SNPs with", length(intersect(inlps, causal_snps)), 
     "true positives." )

# Compare with LASSO
library(glmnet)
fit.cvlasso = cv.glmnet( x, y, alpha = 1 )
l.min = fit.cvlasso $lambda.min # lambda that gives minimum cvm
lasso_min = which( as.vector( coef( fit.cvlasso, s = l.min ) )[-1] != 0 )  
cat( "LASSO with lambda.min selected", length(lasso_min), "SNPs with", 
     length(intersect(lasso_min, causal_snps)), "true positives." )

l.1se = fit.cvlasso $lambda.1se  # largest lambda such that error is within 1 se of the minimum
lasso_1se = which( as.vector( coef( fit.cvlasso, s = l.1se ) )[-1] != 0 )
cat( "LASSO with lambda.1se selected", length(lasso_1se), "SNPs with", 
     length(intersect(lasso_1se, causal_snps)), "true positives." )



