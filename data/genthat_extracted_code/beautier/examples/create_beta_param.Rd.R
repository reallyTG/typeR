library(beautier)


### Name: create_beta_param
### Title: Create a parameter called beta
### Aliases: create_beta_param create_param_beta

### ** Examples

  # Create the parameter
  beta_param <- create_beta_param()

  # Use the parameter in a distribution
  gamma_distr <- create_gamma_distr(
    beta = beta_param
  )

  # Use the distribution to create a BEAST2 input file
  beast2_input_file <- tempfile(fileext = ".xml")
  create_beast2_input_file(
    input_filename = get_fasta_filename(),
    beast2_input_file,
    tree_prior = create_yule_tree_prior(
      birth_rate_distr = gamma_distr
    )
  )
  testit::assert(file.exists(beast2_input_file))



