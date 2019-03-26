library(beautier)


### Name: is_clock_model
### Title: Determine if the object is a valid clock_model
### Aliases: is_clock_model

### ** Examples

  testit::assert(is_clock_model(create_strict_clock_model()))
  testit::assert(is_clock_model(create_rln_clock_model()))
  testit::assert(!is_clock_model("nonsense"))



