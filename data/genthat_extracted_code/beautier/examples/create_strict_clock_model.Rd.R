library(beautier)


### Name: create_strict_clock_model
### Title: Create a strict clock model
### Aliases: create_strict_clock_model create_clock_model_strict

### ** Examples

  strict_clock_model <- create_strict_clock_model(
    clock_rate_param = 1.0,
    clock_rate_distr = create_uniform_distr()
  )

  beast2_input_file <- tempfile(fileext = ".xml")
  create_beast2_input_file(
    get_fasta_filename(),
    beast2_input_file,
    clock_model = strict_clock_model
  )
  testit::assert(file.exists(beast2_input_file))

  strict_clock_model_gamma <- create_strict_clock_model(
    clock_rate_distr = create_gamma_distr()
  )

  beast2_input_file <- tempfile(fileext = ".xml")
  create_beast2_input_file(
    get_fasta_filename(),
    beast2_input_file,
    clock_model = strict_clock_model_gamma
  )
  testit::assert(file.exists(beast2_input_file))



