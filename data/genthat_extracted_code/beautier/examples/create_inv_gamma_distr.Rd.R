library(beautier)


### Name: create_inv_gamma_distr
### Title: Create an inverse-gamma distribution
### Aliases: create_inv_gamma_distr create_distr_inv_gamma

### ** Examples

  inv_gamma_distr <- create_inv_gamma_distr()

  beast2_input_file <- tempfile(fileext = ".xml")
  create_beast2_input_file(
    input_filename = get_fasta_filename(),
    beast2_input_file,
    tree_prior = create_yule_tree_prior(
      birth_rate_distr = inv_gamma_distr
    )
  )
  testit::assert(file.exists(beast2_input_file))



