library(rstan)


### Name: as.array
### Title: Create array, matrix, or data.frame objects from samples in a
###   'stanfit' object
### Aliases: is.array.stanfit as.array.stanfit as.matrix.stanfit
###   as.data.frame.stanfit dim.stanfit dimnames.stanfit names.stanfit
###   names<-.stanfit

### ** Examples
## Not run: 
##D ex_model_code <- '
##D   parameters {
##D     real alpha[2,3];
##D     real beta[2]; 
##D   } 
##D   model {
##D     for (i in 1:2) for (j in 1:3) 
##D       alpha[i, j] ~ normal(0, 1); 
##D     for (i in 1:2) 
##D       beta[i] ~ normal(0, 2); 
##D     # beta ~ normal(0, 2) // vectorized version
##D   } 
##D '
##D 
##D ## fit the model 
##D fit <- stan(model_code = ex_model_code, chains = 4) 
##D 
##D dim(fit)
##D dimnames(fit)
##D is.array(fit) 
##D a <- as.array(fit)
##D m <- as.matrix(fit)
##D d <- as.data.frame(fit)
## End(Not run)


