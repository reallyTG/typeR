library(WhopGenome)


### Name: vcf_getcontignames
### Title: Return the contig/chromosome identifiers used in the VCF file
### Aliases: vcf_getcontignames

### ** Examples

	vcffile <- vcf_open( system.file( "extdata", "ex.vcf.gz" , package="WhopGenome") )
	vcf_getcontignames( vcffile )
	# [1] "Y"



