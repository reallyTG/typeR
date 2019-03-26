library(CollapsABEL)


### Name: plGwas
### Title: Constructor for PlGwasC class
### Aliases: plGwas
###   plGwas,PlGwasC,character,character,character,character,logical,list-method
###   plGwas,RbedInfoC,character,character,character,character,logical,list-method
###   plGwas,RbedInfoC,character,character,character,character,logical,missing-method
###   plGwas,RbedInfoC,character,character,character,character,missing,list-method
###   plGwas,RbedInfoC,character,character,character,character,missing,missing-method
###   plGwas,RbedInfoC,character,character,missing,character,missing,missing-method

### ** Examples

## Not run: 
##D gwas_tag = "mmp13_page_sex_age"
##D rbed_info = rbedInfo(bedstem = "mmp13")
##D pl_gwas = plGwas(rbed_info, 
##D 		pheno = "mmp13.phe",
##D 		pheno_name = "Page", 
##D 		covar_name = "Sex,Cage", 
##D 		gwas_tag = gwas_tag)
##D runGwas(pl_gwas)
##D "mmp13_page_sex_age" %in% listGwasTags() == "TRUE"
##D gwas_out = readGwasOut(pl_gwas, rmGwasOut = FALSE)
##D colClasses(gwas_out) == c("integer", "character", "integer", 
##D     "character", "character", "integer", 
##D     "numeric", "numeric", "numeric")
## End(Not run)




