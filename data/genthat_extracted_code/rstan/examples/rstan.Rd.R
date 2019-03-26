library(rstan)


### Name: rstan-package
### Title: RStan - the R interface to Stan
### Aliases: rstan-package rstan
### Keywords: rstan package

### ** Examples
## Not run: 
##D  
##D 
##D stanmodelcode <- "
##D data {
##D   int<lower=0> N;
##D   real y[N];
##D } 
##D 
##D parameters {
##D   real mu;
##D } 
##D 
##D model {
##D   target += normal_lpdf(mu | 0, 10);
##D   target += normal_lpdf(y  | mu, 1);
##D } 
##D "
##D 
##D y <- rnorm(20) 
##D dat <- list(N = 20, y = y); 
##D fit <- stan(model_code = stanmodelcode, model_name = "example", 
##D             data = dat, iter = 2012, chains = 3, sample_file = 'norm.csv',
##D             verbose = TRUE) 
##D print(fit)
##D 
##D # extract samples 
##D e <- extract(fit, permuted = FALSE) # return a list of arrays 
##D str(e)
##D 
##D arr <- as.array(fit) # return an array 
##D str(arr)
##D 
##D mat <- as.matrix(fit) # return a matrix
##D str(mat)
## End(Not run)


