library(ukbtools)


### Name: ukb_gen_write_plink
### Title: Writes a PLINK format phenotype or covariate file
### Aliases: ukb_gen_write_plink

### ** Examples

## Not run: 
##D 
##D # Automatically inserts FID IID columns required by PLINK
##D 
##D ukb_gen_write_plink(
##D    my_ukb_data,
##D    path = "my_ukb_plink.pheno",
##D    ukb.variables = c("height", "weight", "iq")
##D )
##D 
##D ukb_gen_write_plink(
##D    my_ukb_data,
##D    path = "my_ukb_plink.cov",
##D    ukb.variables = c("age", "socioeconomic_status", "genetic_pcs")
##D )
## End(Not run)




