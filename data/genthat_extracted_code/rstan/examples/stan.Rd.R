library(rstan)


### Name: stan
### Title: Fit a model with Stan
### Aliases: stan
### Keywords: rstan

### ** Examples
## Not run: 
##D #### example 1 
##D library(rstan)
##D scode <- "
##D parameters {
##D   real y[2]; 
##D } 
##D model {
##D   y[1] ~ normal(0, 1);
##D   y[2] ~ double_exponential(0, 2);
##D } 
##D "
##D fit1 <- stan(model_code = scode, iter = 10, verbose = FALSE) 
##D print(fit1)
##D fit2 <- stan(fit = fit1, iter = 10000, verbose = FALSE) 
##D 
##D ## using as.array on the stanfit object to get samples 
##D a2 <- as.array(fit2)
##D 
##D ## extract samples as a list of arrays
##D e2 <- extract(fit2, permuted = FALSE)
##D 
##D #### example 2
##D #### the result of this package is included in the package 
##D 
##D excode <- '
##D   transformed data {
##D     real y[20];
##D     y[1] = 0.5796;  y[2] = 0.2276;   y[3]  = -0.2959; 
##D     y[4] = -0.3742; y[5] = 0.3885;   y[6]  = -2.1585;
##D     y[7] = 0.7111;  y[8] = 1.4424;   y[9]  = 2.5430; 
##D     y[10] = 0.3746; y[11] = 0.4773;  y[12] = 0.1803; 
##D     y[13] = 0.5215; y[14] = -1.6044; y[15] = -0.6703; 
##D     y[16] = 0.9459; y[17] = -0.382;  y[18] = 0.7619;
##D     y[19] = 0.1006; y[20] = -1.7461;
##D   }
##D   parameters {
##D     real mu;
##D     real<lower=0, upper=10> sigma;
##D     vector[2] z[3];
##D     real<lower=0> alpha;
##D   } 
##D   model {
##D     y ~ normal(mu, sigma);
##D     for (i in 1:3) 
##D       z[i] ~ normal(0, 1);
##D     alpha ~ exponential(2);
##D   } 
##D '
##D 
##D exfit <- stan(model_code = excode, save_dso = FALSE, iter = 500)
##D print(exfit)
##D plot(exfit)
## End(Not run)
## Not run: 
##D ## examples of specify argument `init` for function stan
##D 
##D ## define a function to generate initial values that can
##D ## be fed to function stan's argument `init`
##D # function form 1 without arguments 
##D initf1 <- function() {
##D   list(mu = 1, sigma = 4, z = array(rnorm(6), dim = c(3,2)), alpha = 1)
##D } 
##D # function form 2 with an argument named `chain_id`
##D initf2 <- function(chain_id = 1) {
##D   # cat("chain_id =", chain_id, "\n")
##D   list(mu = 1, sigma = 4, z = array(rnorm(6), dim = c(3,2)), alpha = chain_id)
##D } 
##D 
##D # generate a list of lists to specify initial values
##D n_chains <- 4
##D init_ll <- lapply(1:n_chains, function(id) initf2(chain_id = id))
##D  
##D exfit0 <- stan(model_code = excode, init = initf1) 
##D stan(fit = exfit0, init = initf2) 
##D stan(fit = exfit0, init = init_ll, chains = n_chains)
## End(Not run)


