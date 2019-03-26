library(beautier)


### Name: create_log_normal_distr
### Title: Create a log-normal distribution
### Aliases: create_log_normal_distr create_distr_log_normal

### ** Examples

  log_normal_distr <- create_log_normal_distr()

  beast2_input_file <- tempfile(fileext = ".xml")
  create_beast2_input_file(
    input_filename = get_fasta_filename(),
    beast2_input_file,
    tree_prior = create_yule_tree_prior(
      birth_rate_distr = log_normal_distr
    )
  )
  testit::assert(file.exists(beast2_input_file))



