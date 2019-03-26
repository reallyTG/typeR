library(beautier)


### Name: create_beauti_options
### Title: Function to create a set of BEAUti options.
### Aliases: create_beauti_options

### ** Examples

  beauti_options <- create_beauti_options(
    nucleotides_uppercase = TRUE,
    beast2_version = "2.5"
  )
  xml <- create_beast2_input(
    get_fasta_filename(),
    beauti_options = beauti_options
  )
  testit::assert(is.character(xml))
  testit::assert(length(xml) > 1)



