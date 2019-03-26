library(beautier)


### Name: create_yule_tree_prior
### Title: Create a Yule tree prior
### Aliases: create_yule_tree_prior create_tree_prior_yule

### ** Examples

  yule_tree_prior <- create_yule_tree_prior()

  beast2_input_file <- tempfile(fileext = ".xml")
  create_beast2_input_file(
    input_filename = get_fasta_filename(),
    beast2_input_file,
    tree_prior = yule_tree_prior
  )
  testit::assert(file.exists(beast2_input_file))



