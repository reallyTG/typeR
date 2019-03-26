library(beautier)


### Name: create_rate_cg_param
### Title: Create a parameter called 'rate CG'
### Aliases: create_rate_cg_param create_param_rate_cg

### ** Examples

  # Create parameter
  rate_cg_param <- create_rate_cg_param(value = 1, estimate = FALSE)

  # Use the parameter to create a BEAST2 input file
  beast2_input_file <- tempfile(fileext = ".xml")
  create_beast2_input_file(
    input_filename = get_fasta_filename(),
    beast2_input_file,
    site_model = create_gtr_site_model(
      rate_cg_param = rate_cg_param
    )
  )
  testit::assert(file.exists(beast2_input_file))



