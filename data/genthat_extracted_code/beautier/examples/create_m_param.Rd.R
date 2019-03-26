library(beautier)


### Name: create_m_param
### Title: Create a parameter called m
### Aliases: create_m_param create_param_m

### ** Examples

  # Create the parameter
  m_param <- create_m_param()

  # Use the parameter in a distribution
  log_normal_distr <- create_log_normal_distr(
    m = m_param
  )

  # Use the distribution to create a BEAST2 input file
  beast2_input_file <- tempfile(fileext = ".xml")
  create_beast2_input_file(
    input_filename = get_fasta_filename(),
    beast2_input_file,
    tree_prior = create_yule_tree_prior(
      birth_rate_distr = log_normal_distr
    )
  )
  testit::assert(file.exists(beast2_input_file))



