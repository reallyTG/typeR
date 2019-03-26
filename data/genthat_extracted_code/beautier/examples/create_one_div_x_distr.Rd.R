library(beautier)


### Name: create_one_div_x_distr
### Title: Create a 1/x distribution
### Aliases: create_one_div_x_distr create_distr_one_div_x

### ** Examples

  one_div_x_distr <- create_one_div_x_distr()

  beast2_input_file <- tempfile(fileext = ".xml")
  create_beast2_input_file(
    input_filename = get_fasta_filename(),
    beast2_input_file,
    tree_prior = create_yule_tree_prior(
      birth_rate_distr = one_div_x_distr
    )
  )
  testit::assert(file.exists(beast2_input_file))



