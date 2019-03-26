library(tracerer)


### Name: get_tracerer_paths
### Title: Get the full paths of files in the 'inst/extdata' folder
### Aliases: get_tracerer_paths

### ** Examples

  testit::assert(
    length(
      get_tracerer_paths(
        c(
          "beast2_example_output.log",
          "beast2_example_output.trees",
          "beast2_example_output.xml",
          "beast2_example_output.xml.state"
        )
      )
     ) == 4
   )



