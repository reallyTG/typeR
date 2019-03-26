library(tracerer)


### Name: parse_beast_trees
### Title: Parses a BEAST2 .trees output file
### Aliases: parse_beast_trees

### ** Examples

  trees_filename <- get_tracerer_path("beast2_example_output.trees")
  posterior <- parse_beast_trees(trees_filename)
  testit::assert(is_trees_posterior(posterior))



