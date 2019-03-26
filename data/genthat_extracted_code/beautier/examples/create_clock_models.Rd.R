library(beautier)


### Name: create_clock_models
### Title: Creates all supported clock models, which is a list of the types
###   returned by 'create_rln_clock_model', and 'create_strict_clock_model'
### Aliases: create_clock_models

### ** Examples

 clock_models <- create_clock_models()
 testit::assert(beautier:::is_rln_clock_model(clock_models[[1]]))
 testit::assert(beautier:::is_strict_clock_model(clock_models[[2]]))



