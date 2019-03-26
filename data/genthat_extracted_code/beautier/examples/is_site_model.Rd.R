library(beautier)


### Name: is_site_model
### Title: Determine if the object is a valid site_model
### Aliases: is_site_model

### ** Examples

  # site models
  testit::assert(is_site_model(create_gtr_site_model()))
  testit::assert(is_site_model(create_hky_site_model()))
  testit::assert(is_site_model(create_jc69_site_model()))
  testit::assert(is_site_model(create_tn93_site_model()))

  # other models
  testit::assert(!is_site_model(create_strict_clock_model()))
  testit::assert(!is_site_model(create_bd_tree_prior()))
  testit::assert(!is_site_model(create_mcmc()))



