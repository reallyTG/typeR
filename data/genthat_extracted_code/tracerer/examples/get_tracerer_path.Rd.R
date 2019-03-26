library(tracerer)


### Name: get_tracerer_path
### Title: Get the full path of a file in the 'inst/extdata' folder
### Aliases: get_tracerer_path

### ** Examples

  testit::assert(is.character(get_tracerer_path("beast2_example_output.log")))
  testit::assert(is.character(get_tracerer_path("beast2_example_output.trees")))
  testit::assert(is.character(get_tracerer_path("beast2_example_output.xml")))
  testit::assert(is.character(get_tracerer_path("beast2_example_output.xml.state")))



