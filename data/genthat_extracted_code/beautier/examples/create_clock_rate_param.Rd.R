library(beautier)


### Name: create_clock_rate_param
### Title: Create a parameter called 'clock_rate', as needed by
###   'create_strict_clock_model'
### Aliases: create_clock_rate_param create_param_clock_rate

### ** Examples

  clock_rate_param <- create_clock_rate_param(
    id = "anthus_aco", value = 1.0
  )

  # Use the parameter in a clock model
  strict_clock_model <- create_strict_clock_model(
    clock_rate_param = clock_rate_param
  )

  # Use the distribution to create a BEAST2 input file
  beast2_input_file <- tempfile(fileext = ".xml")
  create_beast2_input_file(
    input_filename = get_fasta_filename(),
    beast2_input_file,
    clock_model = strict_clock_model
  )
  testit::assert(file.exists(beast2_input_file))



