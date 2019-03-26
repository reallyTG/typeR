library(beautier)


### Name: create_mean_param
### Title: Create a parameter called mean
### Aliases: create_mean_param create_param_mean

### ** Examples

  # Create the parameter
  mean_param <- create_mean_param(value = 1.0)

  # Use the parameter in a distribution
  exp_distr <- create_exp_distr(
    mean = mean_param
  )

  # Use the distribution to create a BEAST2 input file
  beast2_input_file <- tempfile(fileext = ".xml")
  create_beast2_input_file(
    input_filename = get_fasta_filename(),
    beast2_input_file,
    tree_prior = create_yule_tree_prior(
      birth_rate_distr = exp_distr
    )
  )
  testit::assert(file.exists(beast2_input_file))



