library(tracerer)


### Name: parse_beast_output_files
### Title: Parse all BEAST2 output files
### Aliases: parse_beast_output_files

### ** Examples

  trees_filenames <- get_tracerer_path("beast2_example_output.trees")
  log_filename <- get_tracerer_path("beast2_example_output.log")
  state_filename <- get_tracerer_path("beast2_example_output.xml.state")
  out <- parse_beast_output_files(
    log_filename = log_filename,
    trees_filenames = trees_filenames,
    state_filename = state_filename
  )
  testit::assert("estimates" %in% names(out))
  testit::assert("beast2_example_output_trees" %in% names(out))
  testit::assert("operators" %in% names(out))



