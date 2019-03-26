library(beautier)


### Name: create_tn93_site_model
### Title: Create a TN93 site model
### Aliases: create_tn93_site_model create_site_model_tn93

### ** Examples

 tn93_site_model <- create_tn93_site_model(
   kappa_1_param = 2.0,
   kappa_2_param = 2.0
 )

 create_beast2_input_file(
   input_filename = get_fasta_filename(),
   "beast.xml",
   site_model = tn93_site_model
 )



