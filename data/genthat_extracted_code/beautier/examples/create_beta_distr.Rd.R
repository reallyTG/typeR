library(beautier)


### Name: create_beta_distr
### Title: Create a beta distribution
### Aliases: create_beta_distr create_distr_beta

### ** Examples

  beta_distr <- create_beta_distr()

  beast2_input_file <- tempfile(fileext = ".xml")
  create_beast2_input_file(
    input_filename = get_fasta_filename(),
    beast2_input_file,
    tree_prior = create_yule_tree_prior(
      birth_rate_distr = beta_distr
    )
  )
  testit::assert(file.exists(beast2_input_file))



