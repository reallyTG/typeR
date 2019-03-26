library(rsnps)


### Name: ncbi_snp_query
### Title: Query NCBI's dbSNP for information on a set of SNPs
### Aliases: ncbi_snp_query

### ** Examples

## Not run: 
##D ## an example with both merged SNPs, non-SNV SNPs, regular SNPs,
##D ## SNPs not found, microsatellite
##D SNPs <- c("rs332", "rs420358", "rs1837253", "rs1209415715", "rs111068718")
##D ncbi_snp_query(SNPs)
##D # ncbi_snp_query("123456") ##invalid: must prefix with 'rs'
##D ncbi_snp_query("rs420358")
##D ncbi_snp_query("rs332") # warning that its merged into another, try that
##D ncbi_snp_query("rs121909001")
##D ncbi_snp_query("rs1837253")
##D ncbi_snp_query("rs1209415715")
##D ncbi_snp_query("rs111068718") 
##D ncbi_snp_query(SNPs='rs9970807')
##D 
##D # Curl debugging
##D ncbi_snp_query("rs121909001")
##D ncbi_snp_query("rs121909001", verbose = TRUE)
## End(Not run)



