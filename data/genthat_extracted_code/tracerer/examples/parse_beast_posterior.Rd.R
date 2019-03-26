library(tracerer)


### Name: parse_beast_posterior
### Title: Parses BEAST2 output files to a posterior
### Aliases: parse_beast_posterior

### ** Examples

  trees_filenames <- get_tracerer_path("beast2_example_output.trees")
  log_filename <- get_tracerer_path("beast2_example_output.log")
  posterior <- parse_beast_posterior(
    trees_filenames = trees_filenames,
    log_filename = log_filename
  )
  testit::assert(is_posterior(posterior))



