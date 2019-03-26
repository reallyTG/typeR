library(beautier)


### Name: beautier
### Title: 'beautier': A package to create a 'BEAST2' input file.
### Aliases: beautier beautier-package

### ** Examples

  # Get an example FASTA file
  input_filename <- get_fasta_filename()

  # The file created by beautier, a BEAST2 input file
  output_filename <- tempfile()

  # Use the default BEAUti settings to create a BEAST2 input file
  create_beast2_input_file_from_model(
    input_filename,
    output_filename,
    inference_model = create_inference_model()
  )
  testthat::expect_true(file.exists(output_filename))



