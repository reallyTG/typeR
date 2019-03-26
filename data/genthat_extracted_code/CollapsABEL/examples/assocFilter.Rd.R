library(CollapsABEL)


### Name: assocFilter
### Title: Filter a PlGwasC object by the results of a 'plink --assoc' run
### Aliases: assocFilter

### ** Examples

## Not run: 
##D rbed_info = rbedInfo(bedstem = "mmp13", db_setup = FALSE)
##D pl_gwas = plGwas(rbed_info, 
##D 		pheno = "mmp13.phe",
##D 		pheno_name = "Page", 
##D 		gwas_tag = "mmp13_page_sex_age")
##D runGwas(pl_gwas)
##D x = readGwasOut(pl_gwas, c("SNP", "P"), rmGwasOut = FALSE)
##D pl_gwas1 = assocFilter(pl_gwas, p_threshold = 0.001)
##D runGwas(pl_gwas1)
##D x1 = readGwasOut(pl_gwas1, c("SNP", "P"), rmGwasOut = FALSE)
##D y = dplyr::inner_join(x, x1, by = "SNP")
##D all(y$P.x == y$P.y)
##D all(y$P.y < 0.001)
## End(Not run)




