library(tcgsaseq)


### Name: nb_sim_fn
### Title: Computing negative binomial simulations results
### Aliases: nb_sim_fn
### Keywords: internal

### ** Examples

## Not run: 
##D for (n in c(50,100, 150)){
##D standard.l <- list()
##D betas <- seq(-2, 2, length = 11)
##D stdl.l <- list()
##D ind <- 0
##D for (i in 1:11){
##D  ind <- ind + 1
##D 
##D  if (betas[i] == 0){
##D    gsd <- rsd <- 0
##D  }else{
##D    gsd <- rsd <- 1
##D  }
##D 
##D  standard.sim <- nb_sim_fn(type = 'standard',
##D                            nGenes = 100,
##D                            n = n,
##D                            beta = betas[i],
##D                            re_sd = rsd,
##D                            gene_sd = gsd,
##D                            n_t = 5)
##D 
##D  stdl.l[[ind]] <- c(standard.sim, beta = betas[i])
##D }
##D standard.l <- do.call(rbind, stdl.l)
##D }
## End(Not run)





