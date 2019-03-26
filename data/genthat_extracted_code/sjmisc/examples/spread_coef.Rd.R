library(sjmisc)


### Name: spread_coef
### Title: Spread model coefficients of list-variables into columns
### Aliases: spread_coef

### ** Examples

library(dplyr)
library(tidyr)
library(purrr)
data(efc)

# create nested data frame, grouped by dependency (e42dep)
# and fit linear model for each group. These models are
# stored in the list variable "models".
model.data <- efc %>%
  filter(!is.na(e42dep)) %>%
  group_by(e42dep) %>%
  nest() %>%
  mutate(
    models = map(data, ~lm(neg_c_7 ~ c12hour + c172code, data = .x))
  )

# spread coefficients, so we can easily access and compare the
# coefficients over all models. arguments `se` and `p.val` default
# to `FALSE`, when `model.term` is not specified
spread_coef(model.data, models)
spread_coef(model.data, models, se = TRUE)

# select only specific model term. `se` and `p.val` default to `TRUE`
spread_coef(model.data, models, c12hour)

# spread_coef can be used directly within a pipe-chain
efc %>%
  filter(!is.na(e42dep)) %>%
  group_by(e42dep) %>%
  nest() %>%
  mutate(
    models = map(data, ~lm(neg_c_7 ~ c12hour + c172code, data = .x))
  ) %>%
  spread_coef(models)

# spread_coef() makes it easy to generate bootstrapped
# confidence intervals, using the 'bootstrap()' and 'boot_ci()'
# functions from the 'sjstats' package, which creates nested
# data frames of bootstrap replicates
library(sjstats)
efc %>%
  # generate bootstrap replicates
  bootstrap(100) %>%
  # apply lm to all bootstrapped data sets
  mutate(
    models = map(strap, ~lm(neg_c_7 ~ e42dep + c161sex + c172code, data = .x))
  ) %>%
  # spread model coefficient for all 100 models
  spread_coef(models, se = FALSE, p.val = FALSE) %>%
  # compute the CI for all bootstrapped model coefficients
  boot_ci(e42dep, c161sex, c172code)




