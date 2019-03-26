library(RPANDA)


### Name: fit_t_pl
### Title: High-dimensional phylogenetic models of trait evolution
### Aliases: fit_t_pl

### ** Examples

## No test: 
set.seed(1)
n <- 32 # number of species
p <- 31 # number of traits

tree <- pbtree(n=n) # phylogenetic tree
R <- Posdef(p)      # a random symmetric matrix (covariance)

# simulate a dataset
Y <- mvSIM(tree, model="BM1", nsim=1, param=list(sigma=R))

# fit the model
fit_t_pl(Y, tree, model="BM", method="RidgeAlt")

# try on rotated axis (using PCA)
trans <- prcomp(Y, center=FALSE)
fit_t_pl(trans$x, tree, model="BM", method="RidgeAlt")

# Estimate the SE (similar to Pagel's lambda for BM). 
# Advised with empirical datasets
fit_t_pl(Y, tree, model="BM", method="RidgeAlt", SE=TRUE)

## End(No test)



