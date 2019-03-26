library(beautier)


### Name: are_site_models
### Title: Determine if x consists out of site_models objects
### Aliases: are_site_models

### ** Examples

  jc69_site_model <- create_jc69_site_model()
  gtr_site_model <- create_gtr_site_model()
  both_site_models <- list(jc69_site_model, gtr_site_model)
  testit::assert(are_site_models(jc69_site_model))
  testit::assert(are_site_models(gtr_site_model))
  testit::assert(are_site_models(both_site_models))



