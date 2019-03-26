library(beautier)


### Name: get_gamma_site_model_n_distrs
### Title: Get the number of distributions in a gamma site model
### Aliases: get_gamma_site_model_n_distrs

### ** Examples

  gamma_site_model <- create_gamma_site_model()
  n_distrs <- get_gamma_site_model_n_distrs(
    gamma_site_model
   )
  testit::assert(n_distrs == 0)

  gamma_site_model <- create_gamma_site_model(
    gamma_cat_count = 2,
    gamma_shape_prior_distr = create_exp_distr()
  )
  n_distrs <- get_gamma_site_model_n_distrs(gamma_site_model)
  testit::assert(n_distrs == 1)



