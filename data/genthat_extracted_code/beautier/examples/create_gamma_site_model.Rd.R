library(beautier)


### Name: create_gamma_site_model
### Title: Create a gamma site model, part of a site model
### Aliases: create_gamma_site_model

### ** Examples

  gamma_site_model <- create_gamma_site_model(prop_invariant = 0.5)

  site_model <- create_hky_site_model(gamma_site_model = gamma_site_model)

  beast2_input_file <- tempfile(fileext = ".xml")
  create_beast2_input_file(
    get_fasta_filename(),
    beast2_input_file,
    site_model = site_model
  )
  testit::assert(file.exists(beast2_input_file))



