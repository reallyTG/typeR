library(rsnps)


### Name: ncbi_snp_summary
### Title: Query NCBI's dbSNP for summary information on a set of SNPs
### Aliases: ncbi_snp_summary

### ** Examples

## Not run: 
##D # use with 'rs' or without it
##D ncbi_snp_summary("rs420358")
##D ncbi_snp_summary("420358")
##D 
##D # you can pass > 1
##D x <- c("rs332", "rs420358", "rs1837253", "rs1209415715", "rs111068718")
##D ncbi_snp_summary(x)
##D 
##D ncbi_snp_summary("rs420358")
##D ncbi_snp_summary("rs332") # warning, merged into new one
##D ncbi_snp_summary("rs121909001") 
##D ncbi_snp_summary("rs1837253")
##D ncbi_snp_summary("rs1209415715") # no data available
##D ncbi_snp_summary("rs111068718") # chromosomal information may be unmapped
## End(Not run)



