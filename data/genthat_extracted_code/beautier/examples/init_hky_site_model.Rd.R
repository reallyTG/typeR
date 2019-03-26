library(beautier)


### Name: init_hky_site_model
### Title: Initializes an HKY site model
### Aliases: init_hky_site_model

### ** Examples

  hky_site_model <- create_hky_site_model()
  testit::assert(!beautier:::is_init_hky_site_model(hky_site_model))
  hky_site_model <- beautier:::init_hky_site_model(hky_site_model)
  testit::assert(beautier:::is_init_hky_site_model(hky_site_model))



