library(beautier)


### Name: create_cbs_tree_prior
### Title: Create a Coalescent Bayesian Skyline tree prior
### Aliases: create_cbs_tree_prior create_tree_prior_cbs

### ** Examples

  cbs_tree_prior <- create_cbs_tree_prior()

  beast2_input_file <- tempfile(fileext = ".xml")
  create_beast2_input_file(
    input_filename = get_beautier_path("test_output_6.fas"),
    beast2_input_file,
    tree_prior = cbs_tree_prior
  )
  testit::assert(file.exists(beast2_input_file))



