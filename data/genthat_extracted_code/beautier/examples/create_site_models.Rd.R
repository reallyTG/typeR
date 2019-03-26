library(beautier)


### Name: create_site_models
### Title: Creates all supported site models which is a list of the types
###   returned by 'create_gtr_site_model', 'create_hky_site_model',
###   'create_jc69_site_model' and 'create_tn93_site_model'
### Aliases: create_site_models

### ** Examples

 # All created site models are a kind of site model
 site_models <- beautier:::create_site_models()
 testit::assert(beautier:::is_gtr_site_model(site_models[[1]]))
 testit::assert(beautier:::is_hky_site_model(site_models[[2]]))
 testit::assert(beautier:::is_jc69_site_model(site_models[[3]]))
 testit::assert(beautier:::is_tn93_site_model(site_models[[4]]))

 # Names are conformant
 for (site_model in site_models) {
   testit::assert(site_model$name %in% get_site_model_names())
 }



