library(WhopGenome)


### Name: vcf_restartregion
### Title: Let subsequent read calls return from the start of the currently
###   set region.
### Aliases: vcf_restartregion

### ** Examples

	##
	##	Example:
	##
	vcffile <- vcf_open( system.file( "extdata" , "ex.vcf.gz" , package="WhopGenome" ) )
	vcf_setregion(vcffile, "Y", 1, 100000 )
	
	vcf_readLineVec( vcffile )
	vcf_readLineVec( vcffile )

	vcf_restartregion( vcffile )

	vcf_readLineVec( vcffile )
	vcf_readLineVec( vcffile )



