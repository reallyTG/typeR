library(beautier)


### Name: create_beast2_input
### Title: Create a BEAST2 XML input text
### Aliases: create_beast2_input

### ** Examples

  text <- create_beast2_input(
    input_filename = get_fasta_filename()
  )
  testit::assert(substr(text[1], 1, 5) == "<?xml")
  text[1]
  testit::assert(tail(text, n = 1) == "</beast>")



