library(WhopGenome)


### Name: vcf_selectsamples
### Title: Set or query the active sample selection for a given VCF file or
###   get the entire list of individuals.
### Aliases: vcf_selectsamples vcf_getselectedsamples vcf_getsamples

### ** Examples

	##
	##	Example:
	##
	vcffile <- vcf_open( system.file( "extdata" , "ex.vcf.gz" , package="WhopGenome" ) )
	allsamplenames <- vcf_getsamples( vcffile )
	vcf_selectsamples( vcffile , allsamplenames )



