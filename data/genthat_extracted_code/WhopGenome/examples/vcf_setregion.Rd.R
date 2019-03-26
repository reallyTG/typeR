library(WhopGenome)


### Name: vcf_setregion
### Title: Set region from which to return genome variation data.
### Aliases: vcf_setregion

### ** Examples

	##
	##	Example:
	##
	vcffile <- vcf_open( system.file( "extdata" , "ex.vcf.gz" , package="WhopGenome" ) )
	
	vcf_setregion(vcffile, "Y", 1, 100000 )
	vcf_readLineVec( vcffile )



