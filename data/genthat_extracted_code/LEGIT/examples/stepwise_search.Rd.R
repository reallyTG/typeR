library(LEGIT)


### Name: stepwise_search
### Title: Stepwise search for the best subset of genetic variants or
###   environments with the LEGIT model
### Aliases: stepwise_search

### ** Examples

## Not run: 
##D ## Continuous example
##D train = example_3way(250, 2.5, seed=777)
##D # Forward search for genes based on BIC (in interactive mode)
##D forward_genes_BIC = stepwise_search(train$data, genes_extra=train$G, env_original=train$E,
##D formula=y ~ E*G*z,search_type="forward", search="genes", search_criterion="BIC",
##D interactive_mode=TRUE)
##D # Bidirectional-backward search for environments based on cross-validation error
##D bidir_backward_env_cv = stepwise_search(train$data, genes_original=train$G, env_original=train$E,
##D formula=y ~ E*G*z,search_type="bidirectional-backward", search="env", search_criterion="cv")
##D ## Binary example
##D train_bin = example_2way(500, 2.5, logit=TRUE, seed=777)
##D # Forward search for genes based on cross-validated AUC (in interactive mode)
##D forward_genes_AUC = stepwise_search(train_bin$data, genes_extra=train_bin$G, 
##D env_original=train_bin$E, formula=y ~ E*G,search_type="forward", search="genes", 
##D search_criterion="cv_AUC", classification=TRUE, family=binomial, interactive_mode=TRUE)
##D # Forward search for genes based on AIC
##D bidir_forward_genes_AIC = stepwise_search(train_bin$data, genes_extra=train_bin$G, 
##D env_original=train_bin$E, formula=y ~ E*G,search_type="bidirectional-forward", search="genes", 
##D search_criterion="AIC", classification=TRUE, family=binomial)
## End(Not run)



