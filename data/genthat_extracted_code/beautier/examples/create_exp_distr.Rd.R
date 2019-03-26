library(beautier)


### Name: create_exp_distr
### Title: Create an exponential distribution
### Aliases: create_exp_distr create_distr_exp

### ** Examples

  exp_distr <- create_exp_distr()

  beast2_input_file <- tempfile(fileext = ".xml")
  create_beast2_input_file(
    input_filename = get_fasta_filename(),
    beast2_input_file,
    tree_prior = create_yule_tree_prior(
      birth_rate_distr = exp_distr
    )
  )
  testit::assert(file.exists(beast2_input_file))



