library(beautier)


### Name: create_poisson_distr
### Title: Create a Poisson distribution
### Aliases: create_poisson_distr create_distr_poisson

### ** Examples

  poisson_distr <- create_poisson_distr()

  beast2_input_file <- tempfile(fileext = ".xml")
  create_beast2_input_file(
    input_filename = get_fasta_filename(),
    beast2_input_file,
    tree_prior = create_yule_tree_prior(
      birth_rate_distr = poisson_distr
    )
  )
  testit::assert(file.exists(beast2_input_file))



