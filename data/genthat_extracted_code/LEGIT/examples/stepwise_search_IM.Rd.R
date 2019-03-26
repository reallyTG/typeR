library(LEGIT)


### Name: stepwise_search_IM
### Title: Stepwise search for the best subset of elements in the latent
###   variables with the IMLEGIT model
### Aliases: stepwise_search_IM

### ** Examples

## Not run: 
##D ## Example
##D train = example_3way_3latent(250, 1, seed=777)
##D # Forward search for genes based on BIC (in interactive mode)
##D forward_genes_BIC = stepwise_search_IM(train$data, 
##D latent_var_original=list(G=NULL, E=train$latent_var$E, Z=train$latent_var$Z),
##D latent_var_extra=list(G=train$latent_var$G,E=NULL,Z=NULL), 
##D formula=y ~ E*G*Z,search_type="forward", search=1, search_criterion="BIC",
##D interactive_mode=TRUE)
##D # Bidirectional-backward search for everything based on AIC
##D bidir_backward_AIC = stepwise_search_IM(train$data, latent_var_extra=NULL, 
##D latent_var_original=train$latent_var,
##D formula=y ~ E*G*Z,search_type="bidirectional-backward", search=0, search_criterion="AIC")
## End(Not run)



