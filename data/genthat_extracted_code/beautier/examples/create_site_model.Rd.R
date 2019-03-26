library(beautier)


### Name: create_site_model
### Title: General function to create a site model.
### Aliases: create_site_model

### ** Examples

  # GTR
  create_beast2_input_file(
    input_filename = get_fasta_filename(),
    output_filename = "example_gtr.xml",
    site_model = create_gtr_site_model()
  )
  testthat::expect_true(file.exists("example_gtr.xml"))

  # HKY
  create_beast2_input_file(
    input_filename = get_fasta_filename(),
    output_filename = "example_hky.xml",
    site_model = create_hky_site_model()
  )
  testthat::expect_true(file.exists("example_hky.xml"))

  # JC69
  create_beast2_input_file(
    input_filename = get_fasta_filename(),
    output_filename = "example_jc69.xml",
    site_model = create_jc69_site_model()
  )
  testthat::expect_true(file.exists("example_jc69.xml"))

  # TN93
  create_beast2_input_file(
    input_filename = get_fasta_filename(),
    output_filename = "example_tn93.xml",
    site_model = create_tn93_site_model()
  )
  testthat::expect_true(file.exists("example_tn93.xml"))



