library(beautier)


### Name: create_hky_site_model
### Title: Create an HKY site model
### Aliases: create_hky_site_model create_site_model_hky

### ** Examples

 hky_site_model <- create_hky_site_model()

 create_beast2_input_file(
   input_filename = get_fasta_filename(),
   "beast.xml",
   site_model = hky_site_model
 )



