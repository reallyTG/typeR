library(beautier)


### Name: create_ccp_tree_prior
### Title: Create a Coalescent Constant Population tree prior
### Aliases: create_ccp_tree_prior create_tree_prior_ccp

### ** Examples

  ccp_tree_prior <- create_ccp_tree_prior()

  beast2_input_file <- tempfile(fileext = ".xml")
  create_beast2_input_file(
    input_filename = get_fasta_filename(),
    beast2_input_file,
    tree_prior = ccp_tree_prior
  )
  testit::assert(file.exists(beast2_input_file))



