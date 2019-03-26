library(tcgsaseq)


### Name: nonlin_sim_fn
### Title: Computing nonlinear simulations results
### Aliases: nonlin_sim_fn
### Keywords: internal

### ** Examples


## Not run: 
##D 
##D for (n in c(50,100,150)) {
##D  betas <- seq(-2, 2, length = 11)
##D  standard.l <- list()
##D  for (i in 1:11) {
##D    standard.sim <- nonlin_sim_fn(type = 'standard',
##D                                  nGenes = 100,
##D                                  n = n,
##D                                  beta = betas[i],
##D                                  n_t = 5,
##D                                  re_sd = 1)
##D    standard.l[[as.character(betas[i])]] <- standard.sim
##D  }
##D }
##D 
## End(Not run)

## Not run: 
##D for (n in c(50,100,150)) {
##D  betas <- seq(-2, 2, length = 11)
##D  standard.l <- list()
##D  for (i in 1:11) {
##D    standard.sim <- nonlin_sim_fn(type = 'standard',
##D                                  nGenes = 100,
##D                                  n = n,
##D                                  beta = betas[i],
##D                                  n_t = 5,
##D                                  re_sd = 1)
##D    standard.l[[as.character(betas[i])]] <- standard.sim
##D  }
##D }
## End(Not run)




