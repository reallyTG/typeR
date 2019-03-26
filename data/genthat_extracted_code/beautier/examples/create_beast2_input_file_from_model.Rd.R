library(beautier)


### Name: create_beast2_input_file_from_model
### Title: Create a BEAST2 input file from an inference model
### Aliases: create_beast2_input_file_from_model

### ** Examples

  # Get an example FASTA file
  input_filename <- get_fasta_filename()

  # The file created by beautier, a BEAST2 input file
  output_filename <- tempfile()

  create_beast2_input_file_from_model(
    input_filename,
    output_filename
  )
  testthat::expect_true(file.exists(output_filename))



