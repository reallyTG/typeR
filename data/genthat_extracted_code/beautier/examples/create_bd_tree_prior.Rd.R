library(beautier)


### Name: create_bd_tree_prior
### Title: Create a Birth-Death tree prior
### Aliases: create_bd_tree_prior create_tree_prior_bd

### ** Examples

  bd_tree_prior <- create_bd_tree_prior()

  beast2_input_file <- tempfile(fileext = ".xml")
  create_beast2_input_file(
    input_filename = get_fasta_filename(),
    beast2_input_file,
    tree_prior = bd_tree_prior
  )
  testit::assert(file.exists(beast2_input_file))

  bd_tree_prior_exp <- create_bd_tree_prior(
    birth_rate_distr = create_exp_distr()
  )

  beast2_input_file <- tempfile(fileext = ".xml")
  create_beast2_input_file(
    input_filename = get_fasta_filename(),
    beast2_input_file,
    tree_prior = bd_tree_prior_exp
  )
  testit::assert(file.exists(beast2_input_file))



