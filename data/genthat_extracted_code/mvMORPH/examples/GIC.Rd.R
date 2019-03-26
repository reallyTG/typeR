library(mvMORPH)


### Name: GIC
### Title: Generalized Information Criterion (GIC) to compare models fit
###   with 'mvgls' by Maximum Likelihood (ML) or Penalized Likelihood (PL).
### Aliases: GIC
### Keywords: Model comparison GLS High dimensions

### ** Examples

## No test: 

set.seed(1)
n <- 32 # number of species
p <- 50 # number of traits

tree <- pbtree(n=n) # phylogenetic tree
R <- crossprod(matrix(rnorm(p*p), ncol=p)) # a random symmetric matrix (covariance)
# simulate a dataset
Y <- mvSIM(tree, model="BM1", nsim=1, param=list(sigma=R))

fit1 <- mvgls(Y~1, tree=tree, model="BM", method="H&L")
fit2 <- mvgls(Y~1, tree=tree, model="OU", method="H&L")


GIC(fit1); GIC(fit2)
## End(No test)



