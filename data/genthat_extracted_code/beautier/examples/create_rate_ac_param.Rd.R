library(beautier)


### Name: create_rate_ac_param
### Title: Create a parameter called 'rate AC'
### Aliases: create_rate_ac_param create_param_rate_ac

### ** Examples

  # Create parameter
  rate_ac_param <- create_rate_ac_param(value = 1, estimate = FALSE)

  # Use the parameter to create a BEAST2 input file
  beast2_input_file <- tempfile(fileext = ".xml")
  create_beast2_input_file(
    input_filename = get_fasta_filename(),
    beast2_input_file,
    site_model = create_gtr_site_model(
      rate_ac_param = rate_ac_param
    )
  )
  testit::assert(file.exists(beast2_input_file))



