library(beautier)


### Name: create_beast2_input_file
### Title: Create a BEAST2 input file
### Aliases: create_beast2_input_file

### ** Examples

  # Get an example FASTA file
  input_filename <- get_fasta_filename()

  # The file created by beautier, a BEAST2 input file
  output_filename <- "create_beast2_input_file.xml"

  create_beast2_input_file(
    input_filename,
    output_filename
  )
  testthat::expect_true(file.exists(output_filename))



