library(beautier)


### Name: get_fasta_filename
### Title: Get the path of a FASTA file used in testing
### Aliases: get_fasta_filename

### ** Examples

  filename <- beautier::get_fasta_filename()
  testit::assert(file.exists(filename))

  create_beast2_input_file(
    input_filename = filename,
    "my_beast.xml"
  )



