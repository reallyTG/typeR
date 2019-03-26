library(edstan)


### Name: irt_stan
### Title: Estimate an item response model with Stan
### Aliases: irt_stan

### ** Examples

# List the Stan models included in edstan
folder <- system.file("extdata", package = "edstan")
dir(folder, "\\.stan$")

# List the contents of one of the .stan files
rasch_file <- system.file("extdata/rasch_latent_reg.stan",
                          package = "edstan")
cat(readLines(rasch_file), sep = "\n")

## Not run: 
##D # Fit the Rasch and 2PL models on wide-form data with a latent regression
##D 
##D spelling_list <- irt_data(response_matrix = spelling[, 2:5],
##D                           covariates = spelling[, "male", drop = FALSE],
##D                           formula = ~ 1 + male)
##D 
##D rasch_fit <- irt_stan(spelling_list, iter = 300, chains = 4)
##D print_irt_stan(rasch_fit, spelling_list)
##D 
##D twopl_fit <- irt_stan(spelling_list, model = "2pl_latent_reg.stan",
##D                       iter = 300, chains = 4)
##D print_irt_stan(twopl_fit, spelling_list)
##D 
##D 
##D # Fit the rating scale and partial credit models without a latent regression
##D 
##D agg_list_1 <- irt_data(y = aggression$poly,
##D                        ii = labelled_integer(aggression$description),
##D                        jj = aggression$person)
##D 
##D fit_rsm <- irt_stan(agg_list_1, model = "rsm_latent_reg.stan",
##D                     iter = 300, chains = 4)
##D print_irt_stan(fit_rsm, agg_list_1)
##D 
##D fit_pcm <- irt_stan(agg_list_1, model = "pcm_latent_reg.stan",
##D                     iter = 300, chains = 4)
##D print_irt_stan(fit_pcm, agg_list_1)
##D 
##D 
##D # Fit the generalized rating scale and partial credit models including
##D # a latent regression
##D 
##D agg_list_2 <- irt_data(y = aggression$poly,
##D                        ii = labelled_integer(aggression$description),
##D                        jj = aggression$person,
##D                        covariates = aggression[, c("male", "anger")],
##D                        formula = ~ 1 + male*anger)
##D 
##D fit_grsm <- irt_stan(agg_list_2, model = "grsm_latent_reg.stan",
##D                      iter = 300, chains = 4)
##D print_irt_stan(fit_grsm, agg_list_2)
##D 
##D fit_gpcm <- irt_stan(agg_list_2, model = "gpcm_latent_reg.stan",
##D                      iter = 300, chains = 4)
##D print_irt_stan(fit_grsm, agg_list_2)
## End(Not run)



