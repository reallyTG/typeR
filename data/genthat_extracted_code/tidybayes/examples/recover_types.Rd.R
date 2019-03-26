library(tidybayes)


### Name: recover_types
### Title: Decorate a model fit or sample with data types recovered from
###   the input data
### Aliases: recover_types apply_prototypes
### Keywords: manip

### ** Examples

## No test: 

library(dplyr)
library(magrittr)

if(require("rstan", quietly = TRUE)) {

  # Here's an example dataset with a categorical predictor (`condition`) with several levels:
  set.seed(5)
  n = 10
  n_condition = 5
  ABC =
    data_frame(
      condition = rep(c("A","B","C","D","E"), n),
      response = rnorm(n * 5, c(0,1,2,1,-1), 0.5)
    )

  # We'll fit the following model to it:
  stan_code = "
    data {
      int<lower=1> n;
      int<lower=1> n_condition;
      int<lower=1, upper=n_condition> condition[n];
      real response[n];
    }
    parameters {
      real overall_mean;
      vector[n_condition] condition_zoffset;
      real<lower=0> response_sd;
      real<lower=0> condition_mean_sd;
    }
    transformed parameters {
      vector[n_condition] condition_mean;
      condition_mean = overall_mean + condition_zoffset * condition_mean_sd;
    }
    model {
      response_sd ~ cauchy(0, 1);       // => half-cauchy(0, 1)
      condition_mean_sd ~ cauchy(0, 1); // => half-cauchy(0, 1)
      overall_mean ~ normal(0, 5);

      //=> condition_mean ~ normal(overall_mean, condition_mean_sd)
      condition_zoffset ~ normal(0, 1);

      for (i in 1:n) {
        response[i] ~ normal(condition_mean[condition[i]], response_sd);
      }
    }
    "

  m = stan(model_code = stan_code, data = compose_data(ABC), control = list(adapt_delta=0.99),
    # 1 chain / few iterations just so example runs quickly
    # do not use in practice
    chains = 1, iter = 500)

  # without using recover_types(), the `condition` column returned by spread_draws()
  # will be an integer:
  m %>%
    spread_draws(condition_mean[condition]) %>%
    median_qi()

  # If we apply recover_types() first, subsequent calls to other tidybayes functions will
  # automatically back-convert factors so that they are labeled with their original levels
  # (assuming the same name is used)
  m %<>% recover_types(ABC)

  # now the `condition` column with be a factor with levels "A", "B", "C", ...
  m %>%
    spread_draws(condition_mean[condition]) %>%
    median_qi()

}
## End(No test)



