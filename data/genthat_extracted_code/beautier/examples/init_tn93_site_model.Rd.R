library(beautier)


### Name: init_tn93_site_model
### Title: Initializes a TN93 site model
### Aliases: init_tn93_site_model

### ** Examples

  tn93_site_model <- create_tn93_site_model()
  testit::assert(!beautier:::is_init_tn93_site_model(tn93_site_model))
  tn93_site_model <- beautier:::init_tn93_site_model(tn93_site_model)
  testit::assert(beautier:::is_init_tn93_site_model(tn93_site_model))



