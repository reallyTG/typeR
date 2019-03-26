library(rsnps)


### Name: ncbi_snp_query2
### Title: Query NCBI's dbSNP for information on a set of SNPs
### Aliases: ncbi_snp_query2

### ** Examples

## Not run: 
##D x <- c("rs332", "rs420358", "rs1837253", "rs1209415715", "rs111068718")
##D ncbi_snp_query2(x)
##D # ncbi_snp_query2("123456") ## invalid: must prefix with 'rs'
##D ncbi_snp_query2("rs420358")
##D ncbi_snp_query2("rs332") # warning, merged into new one
##D ncbi_snp_query2("rs121909001") 
##D ncbi_snp_query2("rs1837253")
##D ncbi_snp_query2("rs1209415715") # no data available
##D ncbi_snp_query2("rs111068718") # chromosomal information may be unmapped
## End(Not run)



