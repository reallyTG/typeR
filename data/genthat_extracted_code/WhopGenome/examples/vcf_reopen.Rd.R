library(WhopGenome)


### Name: vcf_reopen
### Title: Reopen a closed or stale VCF file handle.
### Aliases: vcf_reopen

### ** Examples

	vcffile <- vcf_open( system.file( "extdata", "ex.vcf.gz" , package="WhopGenome") )
	vcffile
	vcf_close( vcffile )
	vcffile
	vcf_reopen( vcffile )
	vcffile



