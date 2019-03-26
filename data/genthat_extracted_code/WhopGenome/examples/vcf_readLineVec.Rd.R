library(WhopGenome)


### Name: vcf_readLineVec
### Title: Read a line of data from the given VCF file and return the
###   fields as vector elements
### Aliases: vcf_readLineVec vcf_readLineVecFiltered

### ** Examples

	vcffile <- vcf_open( system.file( "extdata", "ex.vcf.gz" , package="WhopGenome") )
	vcf_readLineVec( vcffile )



