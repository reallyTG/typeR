library(sjstats)


### Name: check_assumptions
### Title: Check model assumptions
### Aliases: check_assumptions outliers heteroskedastic autocorrelation
###   normality multicollin

### ** Examples

data(efc)

fit <- lm(barthtot ~ c160age + c12hour + c161sex + c172code, data = efc)
outliers(fit)
heteroskedastic(fit)
autocorrelation(fit)
normality(fit)
check_assumptions(fit)

fit <- lm(barthtot ~ c160age + c12hour + c161sex + c172code + neg_c_7,
          data = efc)
outliers(fit)
check_assumptions(fit, as.logical = TRUE)

# apply function to multiple models in list-variable
library(purrr)
library(dplyr)
tmp <- efc %>%
  bootstrap(50) %>%
  mutate(
    models = map(strap, ~lm(neg_c_7 ~ e42dep + c12hour + c161sex, data = .x))
  )

# for list-variables, argument 'model.column' is the
# quoted name of the list-variable with fitted models
tmp %>% normality("models")
tmp %>% heteroskedastic("models")

# Durbin-Watson-Test from package 'car' takes a little bit longer due
# to simulation of p-values...
## Not run: 
##D tmp %>% check_assumptions("models", as.logical = TRUE, reps = 100)
## End(Not run)




