library(beautier)


### Name: create_laplace_distr
### Title: Create a Laplace distribution
### Aliases: create_laplace_distr create_distr_laplace

### ** Examples

  laplace_distr <- create_laplace_distr()

  beast2_input_file <- tempfile(fileext = ".xml")
  create_beast2_input_file(
    input_filename = get_fasta_filename(),
    beast2_input_file,
    tree_prior = create_yule_tree_prior(
      birth_rate_distr = laplace_distr
    )
  )
  testit::assert(file.exists(beast2_input_file))



