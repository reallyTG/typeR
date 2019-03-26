library(LEGIT)


### Name: bootstrap_var_select
### Title: Bootstrap variable selection (for IMLEGIT)
### Aliases: bootstrap_var_select

### ** Examples

## Not run: 
##D ## Example
##D train = example_3way_3latent(250, 2, seed=777)
##D # Bootstrap with Bidirectional-backward search for everything based on AIC
##D # Normally you should use a lot more than 10 iterations and extra CPUs (n_cluster)
##D boot = bootstrap_var_select(train$data, latent_var_extra=NULL, 
##D latent_var_original=train$latent_var,
##D formula=y ~ E*G*Z,search_type="bidirectional-backward", search=0, 
##D search_criterion="AIC", boot_iter=10, n_cluster=1)
##D # Assuming it's longitudinal with 5 timepoints, even though it's not
##D id = factor(rep(1:50,each=5))
##D boot_longitudinal = bootstrap_var_select(train$data, latent_var_extra=NULL, 
##D latent_var_original=train$latent_var,
##D formula=y ~ E*G*Z,search_type="bidirectional-backward", search=0, 
##D search_criterion="AIC", boot_iter=10, n_cluster=1, boot_group=id)
## End(Not run)



