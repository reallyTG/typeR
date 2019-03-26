library(beautier)


### Name: are_clock_models
### Title: Determine if x consists out of clock_models objects
### Aliases: are_clock_models

### ** Examples

  rln_clock_model <- create_rln_clock_model()
  strict_clock_model <- create_strict_clock_model()
  both_clock_models <- list(rln_clock_model, strict_clock_model)
  testit::assert(are_clock_models(rln_clock_model))
  testit::assert(are_clock_models(strict_clock_model))
  testit::assert(are_clock_models(both_clock_models))



