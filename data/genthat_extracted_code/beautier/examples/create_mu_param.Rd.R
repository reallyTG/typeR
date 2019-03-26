library(beautier)


### Name: create_mu_param
### Title: Create a parameter called mu
### Aliases: create_mu_param create_param_mu

### ** Examples

  # Create the parameter
  mu_param <- create_mu_param()

  # Use the parameter in a distribution
  laplace_distr <- create_laplace_distr(
    mu = mu_param
  )

  # Use the distribution to create a BEAST2 input file
  beast2_input_file <- tempfile(fileext = ".xml")
  create_beast2_input_file(
    input_filename = get_fasta_filename(),
    beast2_input_file,
    tree_prior = create_yule_tree_prior(
      birth_rate_distr = laplace_distr
    )
  )
  testit::assert(file.exists(beast2_input_file))



