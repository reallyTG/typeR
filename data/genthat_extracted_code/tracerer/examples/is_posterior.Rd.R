library(tracerer)


### Name: is_posterior
### Title: Determines if the input is a BEAST2 posterior
### Aliases: is_posterior

### ** Examples

  trees_filename <- get_tracerer_path("beast2_example_output.trees")
  log_filename <- get_tracerer_path("beast2_example_output.log")
  posterior <- parse_beast_posterior(
    trees_filename = trees_filename,
    log_filename = log_filename
  )
  testit::assert(is_posterior(posterior))



