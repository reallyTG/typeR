library(RPANDA)


### Name: phyl.pca_pl
### Title: Regularized Phylogenetic Principal Component Analysis (PCA).
### Aliases: phyl.pca_pl

### ** Examples

## No test: 
set.seed(1)
n <- 32 # number of species
p <- 31 # number of traits

tree <- pbtree(n=n) # phylogenetic tree
R <- Posdef(p)      # a random symmetric matrix (covariance)

# simulate a dataset
Y <- mvSIM(tree, model="BM1", nsim=1, param=list(sigma=R))

# fit a multivariate Pagel lambda model with Penalized likelihood
fit <- fit_t_pl(Y, tree, model="lambda", method="RidgeAlt")

# Perform a phylogenetic PCA using the model fit (Pagel lambda model)
pca_results <- phyl.pca_pl(fit, plot=T) 

# retrieve the scores
head(pca_results$scores)
## End(No test)



