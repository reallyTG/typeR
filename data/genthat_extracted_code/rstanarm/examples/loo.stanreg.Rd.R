library(rstanarm)


### Name: loo.stanreg
### Title: Information criteria and cross-validation
### Aliases: loo.stanreg loo waic waic.stanreg kfold compare_models
###   loo_model_weights.stanreg_list loo_model_weights

### ** Examples

## No test: 
fit1 <- stan_glm(mpg ~ wt, data = mtcars)
fit2 <- stan_glm(mpg ~ wt + cyl, data = mtcars)

# compare on LOOIC
# (for bigger models use as many cores as possible)
loo1 <- loo(fit1, cores = 2)
print(loo1)
loo2 <- loo(fit2, cores = 2)
print(loo2)

# when comparing exactly two models, the reported 'elpd_diff'
# will be positive if the expected predictive accuracy for the
# second model is higher. the approximate standard error of the
# difference is also reported.
compare_models(loo1, loo2)
compare_models(loos = list(loo1, loo2)) # can also provide list

# when comparing three or more models they are ordered by
# expected predictive accuracy. elpd_diff and se_diff are relative
# to the model with best elpd_loo (first row)
fit3 <- stan_glm(mpg ~ disp * as.factor(cyl), data = mtcars)
loo3 <- loo(fit3, cores = 2, k_threshold = 0.7)
compare_models(loo1, loo2, loo3)

# setting detail=TRUE will also print model formulas
compare_models(loo1, loo2, loo3, detail=TRUE)

# Computing model weights
model_list <- stanreg_list(fit1, fit2, fit3)
loo_model_weights(model_list, cores = 2) # can specify k_threshold=0.7 if necessary

# if you have already computed loo then it's more efficient to pass a list
# of precomputed loo objects than a "stanreg_list", avoiding the need
# for loo_models weights to call loo() internally
loo_list <- list(fit1 = loo1, fit2 = loo2, fit3 = loo3) # names optional (affects printing)
loo_model_weights(loo_list)

# 10-fold cross-validation
(kfold1 <- kfold(fit1, K = 10))
kfold2 <- kfold(fit2, K = 10)
compare_models(kfold1, kfold2, detail=TRUE)

# Cross-validation stratifying by a grouping variable
# (note: might get some divergences warnings with this model but 
# this is just intended as a quick example of how to code this)
library(loo)
fit4 <- stan_lmer(mpg ~ disp + (1|cyl), data = mtcars)
table(mtcars$cyl)
folds_cyl <- kfold_split_stratified(K = 3, x = mtcars$cyl)
table(cyl = mtcars$cyl, fold = folds_cyl)
kfold4 <- kfold(fit4, K = 3, folds = folds_cyl)
## End(No test)




