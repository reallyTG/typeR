library(beautier)


### Name: create_clock_model
### Title: General function to create a clock model
### Aliases: create_clock_model

### ** Examples

  rln_clock_model <- create_rln_clock_model()

  beast2_input_file <- tempfile(fileext = ".xml")
  create_beast2_input_file(
    get_fasta_filename(),
    beast2_input_file,
    clock_model = rln_clock_model
  )
  testit::assert(file.exists(beast2_input_file))

  strict_clock_model <- create_strict_clock_model()

  beast2_input_file <- tempfile(fileext = ".xml")
  create_beast2_input_file(
    get_fasta_filename(),
    beast2_input_file,
    clock_model = strict_clock_model
  )
  testit::assert(file.exists(beast2_input_file))



