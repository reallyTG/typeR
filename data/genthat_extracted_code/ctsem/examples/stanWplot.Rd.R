library(ctsem)


### Name: stanWplot
### Title: Runs stan, and plots sampling information while sampling.
### Aliases: stanWplot

### ** Examples

## Not run: 
##D #### example 1 
##D scode <- "
##D parameters {
##D   real y[2]; 
##D } 
##D model {
##D   y[1] ~ normal(0, .5);
##D   y[2] ~ double_exponential(0, 2);
##D } 
##D "
##D sm <- stan_model(model_code = scode)
##D fit1 <- stanWplot(object = sm,iter = 100000,chains=2,cores=1)
## End(Not run)



