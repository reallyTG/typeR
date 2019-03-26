library(ukbtools)


### Name: ukb_gen_write_bgenie
### Title: Writes a BGENIE format phenotype or covariate file.
### Aliases: ukb_gen_write_bgenie

### ** Examples

## Not run: 
##D 
##D # Automatically sorts observations to match UKB sample file and writes missing values as -999
##D 
##D my_ukb_sample <- ukb_gen_read_sample("ukb.sample")
##D 
##D ukb_gen_write_bgenie(
##D    my_ukb_data,
##D    ukb.sample = my_ukb_sample,
##D    ukb.variables = c("height", "weight", "iq")
##D    path = "my_ukb_bgenie.pheno",
##D )
##D 
##D ukb_gen_write_bgenie(
##D    my_ukb_data,
##D    ukb.sample = my_ukb_sample,
##D    ukb.variables = c("age", "socioeconomic_status", "genetic_pcs")
##D    path = "my_ukb_bgenie.cov",
##D )
## End(Not run)




