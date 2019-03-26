library(RPANDA)


### Name: ancestral
### Title: Estimation of traits ancestral states.
### Aliases: ancestral

### ** Examples

## No test: 
set.seed(1)
n <- 32 # number of species
p <- 31 # number of traits

tree <- pbtree(n=n) # phylogenetic tree
R <- Posdef(p)      # a random symmetric matrix (covariance)

# simulate a dataset
Y <- mvSIM(tree, model="BM1", nsim=1, param=list(sigma=R))

# fit a multivariate BM with Penalized likelihood
fit <- fit_t_pl(Y, tree, model="BM", method="RidgeAlt")

# Perform the ancestral states reconstruction
anc <- ancestral(fit)

# retrieve the scores
head(anc$nodes)
## End(No test)



