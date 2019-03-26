library(WhopGenome)


### Name: vcf_readLineDF
### Title: Read a line of data from the given VCF file and return it as a
###   data frame
### Aliases: vcf_readLineDF

### ** Examples

	vcffile <- vcf_open( system.file( "extdata", "ex.vcf.gz" , package="WhopGenome") )
	d <- vcf_readLineDF( vcffile )



