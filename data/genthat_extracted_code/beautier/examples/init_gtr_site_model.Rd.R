library(beautier)


### Name: init_gtr_site_model
### Title: Initializes a GTR site model
### Aliases: init_gtr_site_model

### ** Examples

  gtr_site_model <- create_gtr_site_model()
  testit::assert(!beautier:::is_init_gtr_site_model(gtr_site_model))
  gtr_site_model <- beautier:::init_gtr_site_model(gtr_site_model)
  testit::assert(beautier:::is_init_gtr_site_model(gtr_site_model))



