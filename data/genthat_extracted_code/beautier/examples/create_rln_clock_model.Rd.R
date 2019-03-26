library(beautier)


### Name: create_rln_clock_model
### Title: Create a relaxed log-normal clock model
### Aliases: create_rln_clock_model create_clock_model_rln

### ** Examples

  rln_clock_model <- create_rln_clock_model()

  beast2_input_file <- tempfile(fileext = ".xml")
  create_beast2_input_file(
    get_fasta_filename(),
    beast2_input_file,
    clock_model = rln_clock_model
  )
  testit::assert(file.exists(beast2_input_file))

  rln_clock_model_exp <- create_rln_clock_model(
    mean_rate_prior_distr = create_exp_distr()
  )

  beast2_input_file <- tempfile(fileext = ".xml")
  create_beast2_input_file(
    get_fasta_filename(),
    beast2_input_file,
    clock_model = rln_clock_model_exp
  )
  testit::assert(file.exists(beast2_input_file))



