library(beautier)


### Name: create_jc69_site_model
### Title: Create a JC69 site model
### Aliases: create_jc69_site_model create_site_model_jc69

### ** Examples

 jc69_site_model <- create_jc69_site_model()

 create_beast2_input_file(
   input_filename = get_fasta_filename(),
   "beast.xml",
   site_model = jc69_site_model
 )



