## ---- include = FALSE----------------------------------------------------
# Hidden setup
knitr::opts_chunk$set(eval = FALSE)
set.seed(17)

## ---- message = FALSE, results = 'hide'----------------------------------
#  # Load packages and set options
#  library(edstan)
#  rstan_options(auto_write = TRUE)
#  options(mc.cores = parallel::detectCores())

## ------------------------------------------------------------------------
#  # Summarize the spelling data
#  str(spelling)

## ------------------------------------------------------------------------
#  # Make a data list
#  simple_list <- irt_data(response_matrix = spelling[, -1])
#  str(simple_list)

## ------------------------------------------------------------------------
#  # Make a data list with person covariates
#  latent_reg_list <- irt_data(response_matrix = spelling[, -1],
#                              covariates = spelling[, "male", drop = FALSE],
#                              formula = ~ 1 + male)
#  str(latent_reg_list)

## ---- message=FALSE, results='hide'--------------------------------------
#  # Fit the Rasch model
#  fit_rasch <- irt_stan(latent_reg_list, model = "rasch_latent_reg.stan",
#                        iter = 300, chains = 4)

## ---- fig.width=6--------------------------------------------------------
#  # View convergence statistics
#  stan_columns_plot(fit_rasch)

## ------------------------------------------------------------------------
#  # View a summary of parameter posteriors					
#  print_irt_stan(fit_rasch, latent_reg_list)

## ---- eval=FALSE---------------------------------------------------------
#  # Fit the Rasch model
#  fit_rasch <- irt_stan(latent_reg_list, model = "2pl_latent_reg.stan",
#                        iter = 300, chains = 4)

## ------------------------------------------------------------------------
#  # Describe the data
#  str(aggression)

## ------------------------------------------------------------------------
#  # Show an example of using labelled_integer()
#  labelled_integer(aggression$description[1:5])

## ------------------------------------------------------------------------
#  # Make the data list
#  agg_list <- irt_data(y = aggression$poly,
#                       ii = labelled_integer(aggression$description),
#                       jj = aggression$person,
#                       covariates = aggression[, c("male", "anger")],
#                       formula = ~ 1 + male*anger)
#  str(agg_list)

## ---- message=FALSE, results='hide'--------------------------------------
#  # Fit the generalized partial credit model
#  fit_gpcm <- irt_stan(agg_list, model = "gpcm_latent_reg.stan",
#                       iter = 300, chains = 4)

## ---- fig.width=6--------------------------------------------------------
#  # View convergence statistics
#  stan_columns_plot(fit_gpcm)

## ------------------------------------------------------------------------
#  # View a summary of parameter posteriors	
#  print_irt_stan(fit_gpcm, agg_list)

## ------------------------------------------------------------------------
#  # Find and view the "simple" Rasch model
#  rasch_file <- system.file("extdata/rasch_simple.stan",
#                            package = "edstan")
#  cat(readLines(rasch_file), sep = "\n")

