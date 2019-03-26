library(beautier)


### Name: create_normal_distr
### Title: Create an normal distribution
### Aliases: create_normal_distr create_distr_normal

### ** Examples

  normal_distr <- create_normal_distr()

  beast2_input_file <- tempfile(fileext = ".xml")
  create_beast2_input_file(
    input_filename = get_fasta_filename(),
    beast2_input_file,
    tree_prior = create_yule_tree_prior(
      birth_rate_distr = normal_distr
    )
  )
  testit::assert(file.exists(beast2_input_file))



