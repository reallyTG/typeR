library(MixSIAR)


### Name: compare_models
### Title: Compare the predictive accuracy of 2 or more MixSIAR models
### Aliases: compare_models

### ** Examples

## Not run: 
##D # Model 1 = wolf diet by Region + Pack
##D mix.1 <- load_mix_data(filename=mix.filename, 
##D                      iso_names=c("d13C","d15N"), 
##D                      factors=c("Region","Pack"), 
##D                      fac_random=c(TRUE,TRUE), 
##D                      fac_nested=c(FALSE,TRUE), 
##D                      cont_effects=NULL)
##D source.1 <- load_source_data(filename=source.filename, source_factors="Region",
##D                              conc_dep=FALSE, data_type="means", mix.1)
##D discr.1 <- load_discr_data(filename=discr.filename, mix.1)
##D 
##D # Run Model 1
##D jags.1 <- run_model(run="test", mix.1, source.1, discr.1, model_filename, 
##D                     alpha.prior = 1, resid_err=T, process_err=T)
##D                     
##D # Model 2 = wolf diet by Region (no Pack)
##D mix.2 <- load_mix_data(filename=mix.filename, 
##D                      iso_names=c("d13C","d15N"), 
##D                      factors=c("Region"), 
##D                      fac_random=c(TRUE), 
##D                      fac_nested=c(FALSE), 
##D                      cont_effects=NULL)
##D source.2 <- load_source_data(filename=source.filename, source_factors="Region",
##D                              conc_dep=FALSE, data_type="means", mix.2)
##D discr.2 <- load_discr_data(filename=discr.filename, mix.2)
##D 
##D # Run Model 2
##D jags.2 <- run_model(run="test", mix.2, source.2, discr.2, model_filename, 
##D                     alpha.prior = 1, resid_err=T, process_err=T)
##D                     
##D # Compare models 1 and 2 using LOO
##D compare_models(x=list(jags.1, jags.2), loo=TRUE)
##D 
##D # Compare models 1 and 2 using WAIC
##D compare_models(x=list(jags.1, jags.2), loo=FALSE)
##D 
##D # Get WAIC for model 1
##D compare_models(x=list(jags.1), loo=FALSE)
##D 
##D # Create named list of rjags objects to get model names in summary
##D x <- list(jags.1, jags.2)
##D names(x) <- c("Region + Pack", "Region")
##D compare_models(x)
## End(Not run)




