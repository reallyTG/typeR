library(beautier)


### Name: create_gamma_distr
### Title: Create a gamma distribution
### Aliases: create_gamma_distr create_distr_gamma

### ** Examples

  gamma_distr <- create_gamma_distr(
     alpha = 0.05,
     beta = 10.0
  )

  gtr_site_model <- create_gtr_site_model(
    rate_ac_prior_distr = gamma_distr
  )

  beast2_input_file <- tempfile(fileext = ".xml")
  create_beast2_input_file(
    input_filename = get_fasta_filename(),
    beast2_input_file,
    site_model = gtr_site_model
  )
  testit::assert(file.exists(beast2_input_file))



