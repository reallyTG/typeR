library(beautier)


### Name: init_jc69_site_model
### Title: Initializes a JC69 site model
### Aliases: init_jc69_site_model

### ** Examples

  hky_site_model <- create_hky_site_model()
  testit::assert(!beautier:::is_init_hky_site_model(hky_site_model))
  hky_site_model <- beautier:::init_hky_site_model(hky_site_model)
  testit::assert(beautier:::is_init_hky_site_model(hky_site_model))



