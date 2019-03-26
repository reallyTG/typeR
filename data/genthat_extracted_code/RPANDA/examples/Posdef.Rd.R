library(RPANDA)


### Name: Posdef
### Title: Positive definite symmetric matrices
### Aliases: Posdef

### ** Examples

## No test: 
set.seed(123)
n <- 32 # number of species
p <- 40 # number of traits

tree <- pbtree(n=n) # phylogenetic tree
R <- Posdef(p) # a random symmetric matrix (covariance)
# simulate a dataset
Y <- mvSIM(tree, model="BM1", nsim=1, param=list(sigma=R))

test <- fit_t_pl(Y, tree, model="BM", method="RidgeAlt")
GIC(test)

## End(No test)



