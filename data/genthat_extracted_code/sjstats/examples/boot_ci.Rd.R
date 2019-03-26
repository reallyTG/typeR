library(sjstats)


### Name: boot_ci
### Title: Standard error and confidence intervals for bootstrapped
###   estimates
### Aliases: boot_ci boot_se boot_p boot_est

### ** Examples

library(dplyr)
library(purrr)
data(efc)
bs <- bootstrap(efc, 100)

# now run models for each bootstrapped sample
bs$models <- map(bs$strap, ~lm(neg_c_7 ~ e42dep + c161sex, data = .x))

# extract coefficient "dependency" and "gender" from each model
bs$dependency <- map_dbl(bs$models, ~coef(.x)[2])
bs$gender <- map_dbl(bs$models, ~coef(.x)[3])

# get bootstrapped confidence intervals
boot_ci(bs$dependency)

# compare with model fit
fit <- lm(neg_c_7 ~ e42dep + c161sex, data = efc)
confint(fit)[2, ]

# alternative function calls.
boot_ci(bs$dependency)
boot_ci(bs, dependency)
boot_ci(bs, dependency, gender)
boot_ci(bs, dependency, gender, method = "q")


# compare coefficients
mean(bs$dependency)
boot_est(bs$dependency)
coef(fit)[2]


# bootstrap() and boot_ci() work fine within pipe-chains
efc %>%
  bootstrap(100) %>%
  mutate(
    models = map(strap, ~lm(neg_c_7 ~ e42dep + c161sex, data = .x)),
    dependency = map_dbl(models, ~coef(.x)[2])
  ) %>%
  boot_ci(dependency)

# check p-value
boot_p(bs$gender)
summary(fit)$coefficients[3, ]

## Not run: 
##D # 'spread_coef()' from the 'sjmisc'-package makes it easy to generate
##D # bootstrapped statistics like confidence intervals or p-values
##D library(dplyr)
##D library(sjmisc)
##D efc %>%
##D   # generate bootstrap replicates
##D   bootstrap(100) %>%
##D   # apply lm to all bootstrapped data sets
##D   mutate(
##D     models = map(strap, ~lm(neg_c_7 ~ e42dep + c161sex + c172code, data = .x))
##D   ) %>%
##D   # spread model coefficient for all 100 models
##D   spread_coef(models) %>%
##D   # compute the CI for all bootstrapped model coefficients
##D   boot_ci(e42dep, c161sex, c172code)
##D 
##D # or...
##D efc %>%
##D   # generate bootstrap replicates
##D   bootstrap(100) %>%
##D   # apply lm to all bootstrapped data sets
##D   mutate(
##D     models = map(strap, ~lm(neg_c_7 ~ e42dep + c161sex + c172code, data = .x))
##D   ) %>%
##D   # spread model coefficient for all 100 models
##D   spread_coef(models, append = FALSE) %>%
##D   # compute the CI for all bootstrapped model coefficients
##D   boot_ci()
## End(Not run)




