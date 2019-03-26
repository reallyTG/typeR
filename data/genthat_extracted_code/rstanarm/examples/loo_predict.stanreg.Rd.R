library(rstanarm)


### Name: loo_predict.stanreg
### Title: Compute weighted expectations using LOO
### Aliases: loo_predict.stanreg loo_predict loo_linpred
###   loo_predictive_interval loo_linpred.stanreg
###   loo_predictive_interval.stanreg

### ** Examples

## Not run: 
##D if (!exists("example_model")) example(example_model)
##D 
##D # optionally, log-weights can be pre-computed and reused
##D psis_result <- loo::psis(log_ratios = -log_lik(example_model))
##D 
##D loo_probs <- loo_linpred(example_model, type = "mean", transform = TRUE, psis_object = psis_result)
##D str(loo_probs)
##D 
##D loo_pred_var <- loo_predict(example_model, type = "var", psis_object = psis_result)
##D str(loo_pred_var)
##D 
##D loo_pred_ints <- loo_predictive_interval(example_model, prob = 0.8, psis_object = psis_result)
##D str(loo_pred_ints)
## End(Not run)




