library(beautier)


### Name: create_sigma_param
### Title: Create a parameter called sigma
### Aliases: create_sigma_param create_param_sigma

### ** Examples

  # Create the parameter
  sigma_param <- create_sigma_param()

  # Use the parameter in a distribution
  normal_distr <- create_normal_distr(
    sigma = sigma_param
  )

  # Use the distribution to create a BEAST2 input file
  beast2_input_file <- tempfile(fileext = ".xml")
  create_beast2_input_file(
    input_filename = get_fasta_filename(),
    beast2_input_file,
    tree_prior = create_yule_tree_prior(
      birth_rate_distr = normal_distr
    )
  )
  testit::assert(file.exists(beast2_input_file))



