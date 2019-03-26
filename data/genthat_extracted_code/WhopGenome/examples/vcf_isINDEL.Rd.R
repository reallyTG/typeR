library(WhopGenome)


### Name: vcf_isINDEL
### Title: Determines whether the last vcf_parse-call returned a InDel
###   (instead of SNP)
### Aliases: vcf_isINDEL

### ** Examples

	vcffile <- vcf_open( system.file( "extdata", "ex.vcf.gz" , package="WhopGenome") )
	vcf_parseNextSNP( vcffile )
	vcf_getPos( vcffile )
	vcf_isINDEL( vcffile )



