library(sjstats)


### Name: se
### Title: Standard Error for variables or coefficients
### Aliases: se se.sj_icc_merMod se.sj_icc

### ** Examples

library(lme4)
library(sjmisc)

# compute standard error for vector
se(rnorm(n = 100, mean = 3))

# compute standard error for each variable in a data frame
data(efc)
se(efc[, 1:3])

# compute standard error for merMod-coefficients
library(lme4)
fit <- lmer(Reaction ~ Days + (Days | Subject), sleepstudy)
se(fit)

# compute odds-ratio adjusted standard errors, based on delta method
# with first-order Taylor approximation.
data(efc)
efc$services <- sjmisc::dicho(efc$tot_sc_e, dich.by = 0)
fit <- glm(
  services ~ neg_c_7 + c161sex + e42dep,
  data = efc,
  family = binomial(link = "logit")
)
se(fit)

# compute odds-ratio adjusted standard errors for generalized
# linear mixed model, also based on delta method

# create binary response
sleepstudy$Reaction.dicho <- dicho(sleepstudy$Reaction, dich.by = "median")
fit <- glmer(
  Reaction.dicho ~ Days + (Days | Subject),
  data = sleepstudy,
  family = binomial("logit")
)
se(fit)

# compute standard error for proportions
efc$e42dep <- to_label(efc$e42dep)
se(table(efc$e42dep))

# including weights
efc$weights <- rnorm(nrow(efc), 1, .25)
se(xtabs(efc$weights ~ efc$e42dep))

# compute standard error from regression coefficient and p-value
se(list(estimate = .3, p.value = .002))

## Not run: 
##D # compute standard error of ICC for the linear mixed model
##D icc(fit)
##D se(icc(fit))
##D 
##D # the standard error for the ICC can be computed manually in this way,
##D # taking the fitted model example from above
##D library(dplyr)
##D library(purrr)
##D dummy <- sleepstudy %>%
##D   # generate 100 bootstrap replicates of dataset
##D   bootstrap(100) %>%
##D   # run mixed effects regression on each bootstrap replicate
##D   # and compute ICC for each "bootstrapped" regression
##D   mutate(
##D     models = map(strap, ~lmer(Reaction ~ Days + (Days | Subject), data = .x)),
##D     icc = map_dbl(models, ~icc(.x))
##D   )
##D 
##D # now compute SE and p-values for the bootstrapped ICC, values
##D # may differ from above example due to random seed
##D boot_se(dummy, icc)
##D boot_p(dummy, icc)
## End(Not run)





