library(beautier)


### Name: get_beautier_paths
### Title: Get the full paths of files in the 'inst/extdata' folder
### Aliases: get_beautier_paths

### ** Examples

  testit::assert(
    length(
      get_beautier_paths(
        c("test_output_0.fas", "anthus_aco.fas", "anthus_nd2.fas")
      )
     ) == 3
   )



