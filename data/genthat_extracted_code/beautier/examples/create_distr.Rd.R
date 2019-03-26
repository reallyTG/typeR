library(beautier)


### Name: create_distr
### Title: General function to create a distribution.
### Aliases: create_distr

### ** Examples

  # Use any distribution
  distr <- create_beta_distr()

  beast2_input_file <- tempfile(fileext = ".xml")
  create_beast2_input_file(
    input_filename = get_fasta_filename(),
    beast2_input_file,
    tree_prior = create_yule_tree_prior(
      birth_rate_distr = distr
    )
  )
  testit::assert(file.exists(beast2_input_file))



