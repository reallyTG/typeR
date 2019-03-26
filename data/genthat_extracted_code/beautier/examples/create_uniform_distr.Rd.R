library(beautier)


### Name: create_uniform_distr
### Title: Create a uniform distribution
### Aliases: create_uniform_distr create_distr_uniform

### ** Examples

  uniform_distr <- create_uniform_distr()

  beast2_input_file <- tempfile(fileext = ".xml")
  create_beast2_input_file(
    input_filename = get_fasta_filename(),
    beast2_input_file,
    tree_prior = create_yule_tree_prior(
      birth_rate_distr = uniform_distr
    )
  )
  testit::assert(file.exists(beast2_input_file))



