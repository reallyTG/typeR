library(WhopGenome)


### Name: vcf_readLineRaw
### Title: Read a line of data from the given VCF file and return it as a
###   string without postprocessing.
### Aliases: vcf_readLineRaw vcf_readLineRawFiltered

### ** Examples

	vcffile <- vcf_open( system.file( "extdata", "ex.vcf.gz" , package="WhopGenome") )
	d <- vcf_readLineRaw( vcffile )



