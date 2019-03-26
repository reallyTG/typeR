library(WhopGenome)


### Name: vcf_isSNP
### Title: Determines whether the last vcf_parse-call returned a SNP
###   (instead of InDel)
### Aliases: vcf_isSNP

### ** Examples

	vcffile <- vcf_open( system.file( "extdata", "ex.vcf.gz" , package="WhopGenome") )
	vcf_parseNextSNP( vcffile )
	vcf_getPos( vcffile )
	vcf_isSNP( vcffile )



