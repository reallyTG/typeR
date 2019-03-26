library(rstan)


### Name: stanc
### Title: Translate Stan model specification to C++ code
### Aliases: stanc stanc_builder

### ** Examples

stanmodelcode <- "
data {
  int<lower=0> N;
  real y[N];
} 

parameters {
  real mu;
} 

model {
  mu ~ normal(0, 10);
  y ~ normal(mu, 1); 
} 
"

r <- stanc(model_code = stanmodelcode, model_name = "normal1") 
str(r)



