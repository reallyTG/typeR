library(beautier)


### Name: create_scale_param
### Title: Create a parameter called scale
### Aliases: create_scale_param create_param_scale

### ** Examples

  # Create the parameter
  scale_param <- create_scale_param()

  # Use the parameter in a distribution
  laplace_distr <- create_laplace_distr(
    scale = scale_param
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



