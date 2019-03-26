library(tidybayes)


### Name: gather_emmeans_draws
### Title: Extract a tidy data frame of draws of posterior distributions of
###   "estimated marginal means" (emmeans/lsmeans) from a Bayesian model
###   fit.
### Aliases: gather_emmeans_draws
### Keywords: manip

### ** Examples


library(dplyr)
library(magrittr)

if (
  require("rstanarm", quietly = TRUE) &&
  require("emmeans", quietly = TRUE)
) {

  # Here's an example dataset with a categorical predictor (`condition`) with several levels:
  set.seed(5)
  n = 10
  n_condition = 5
  ABC =
    data_frame(
      condition = rep(c("A","B","C","D","E"), n),
      response = rnorm(n * 5, c(0,1,2,1,-1), 0.5)
    )

  m = stan_glm(response ~ condition, data = ABC,
    # 1 chain / few iterations just so example runs quickly
    # do not use in practice
    chains = 1, iter = 500)

  # Once we've fit the model, we can use emmeans() (and functions
  # from that package) to get whatever marginal distributions we want.
  # For example, we can get marginal means by condition:
  m %>%
    emmeans(~ condition) %>%
    gather_emmeans_draws() %>%
    median_qi()

  # or we could get pairwise differences:
  m %>%
    emmeans(~ condition) %>%
    contrast(method = "pairwise") %>%
    gather_emmeans_draws() %>%
    median_qi()

  # see the documentation of emmeans() for more examples of types of
  # contrasts supported by that packge.
}



