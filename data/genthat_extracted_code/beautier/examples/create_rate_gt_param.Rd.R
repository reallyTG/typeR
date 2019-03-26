library(beautier)


### Name: create_rate_gt_param
### Title: Create a parameter called 'rate GT'
### Aliases: create_rate_gt_param create_param_rate_gt

### ** Examples

  # Create parameter
  rate_gt_param <- create_rate_gt_param(value = 1, estimate = FALSE)

  # Use the parameter to create a BEAST2 input file
  beast2_input_file <- tempfile(fileext = ".xml")
  create_beast2_input_file(
    input_filename = get_fasta_filename(),
    beast2_input_file,
    site_model = create_gtr_site_model(
      rate_gt_param = rate_gt_param
    )
  )
  testit::assert(file.exists(beast2_input_file))



