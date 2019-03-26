library(RPANDA)


### Name: GIC.fit_pl.rpanda
### Title: Generalized Information Criterion (GIC) to compare models fit by
###   Maximum Likelihood (ML) or Penalized Likelihood (PL).
### Aliases: GIC.fit_pl.rpanda

### ** Examples

## No test: 
set.seed(1)
n <- 32 # number of species
p <- 40 # number of traits

tree <- pbtree(n=n) # phylogenetic tree
R <- Posdef(p)      # a random symmetric matrix (covariance)
# simulate a dataset
Y <- mvSIM(tree, model="BM1", nsim=1, param=list(sigma=R))

fit1 <- fit_t_pl(Y, tree, model="BM", method="RidgeAlt")
fit2 <- fit_t_pl(Y, tree, model="OU", method="RidgeAlt")

GIC(fit1); GIC(fit2)
## End(No test)



