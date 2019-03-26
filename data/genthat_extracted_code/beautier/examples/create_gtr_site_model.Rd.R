library(beautier)


### Name: create_gtr_site_model
### Title: Create a GTR site model
### Aliases: create_gtr_site_model create_site_model_gtr

### ** Examples

  gtr_site_model <- create_gtr_site_model(
    rate_ac_param = 1.2,
    rate_ag_param = 2.3,
    rate_at_param = 3.4,
    rate_cg_param = 4.5,
    rate_ct_param = 5.6,
    rate_gt_param = 6.7
 )

  beast2_input_file <- tempfile(fileext = ".xml")
  create_beast2_input_file(
    input_filename = get_fasta_filename(),
    beast2_input_file,
    site_model = gtr_site_model
  )
  testit::assert(file.exists(beast2_input_file))



