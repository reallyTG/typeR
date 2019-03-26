library(RPANDA)


### Name: gic_criterion
### Title: Generalized Information Criterion (GIC) to compare models fit by
###   Maximum Likelihood (ML) or Penalized Likelihood (PL).
### Aliases: gic_criterion

### ** Examples

## No test: 
set.seed(123)
n <- 32 # number of species
p <- 2 # number of traits

tree <- pbtree(n=n) # phylogenetic tree
R <- Posdef(p)      # a random symmetric matrix (covariance)

# simulate a dataset
Y <- mvSIM(tree, model="BM1", nsim=1, param=list(sigma=R))

# Compute the GIC for ML
gic_criterion(Y, tree, model="BM", method="ML", tuning=0) # ML

# Compare with PL?
#test <- fit_t_pl(Y, tree, model="BM", method="RidgeAlt")
#GIC(test)
## End(No test)



