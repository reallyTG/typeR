library(WhopGenome)


### Name: vcf_eor
### Title: Determine whether all lines in the selected region have been
###   read.
### Aliases: vcf_eor

### ** Examples

	vcffile <- vcf_open( system.file( "extdata", "ex.vcf.gz" , package="WhopGenome") )
	vcf_setregion(vcffile, "Y", 1, 100000 )
	while( !vcf_eor(vcffile) )
	{
		vcf_readLineVec( vcffile )
	}



