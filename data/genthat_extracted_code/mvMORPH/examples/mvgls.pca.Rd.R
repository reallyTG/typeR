library(mvMORPH)


### Name: mvgls.pca
### Title: Principal Component Analysis (PCA) based on GLS estimate of the
###   traits variance-covariance matrix (possibly regularized).
### Aliases: mvgls.pca
### Keywords: GIC GLS PCA Regularization Penalized likelihood High
###   dimensions

### ** Examples

## No test: 
set.seed(1)
n <- 32 # number of species
p <- 30 # number of traits

tree <- pbtree(n=n) # phylogenetic tree
R <- crossprod(matrix(rnorm(p*p),p))  # a random symmetric matrix (covariance)

# simulate a dataset
Y <- mvSIM(tree, model="BM1", nsim=1, param=list(sigma=R))

# The conventional phylogenetic PCA
phylo_pca <- mvgls(Y~1, tree=tree, model="BM", method="LL")
mvgls.pca(phylo_pca, plot=T) 




# fit a multivariate Pagel lambda model with Penalized likelihood
fit <- mvgls(Y~1, tree=tree, model="lambda", method="LOO", penalty="RidgeAlt")

# Perform a regularized phylogenetic PCA using the model fit (Pagel lambda model)
pca_results <- mvgls.pca(fit, plot=T) 

# retrieve the scores
head(pca_results$scores)
## End(No test)



