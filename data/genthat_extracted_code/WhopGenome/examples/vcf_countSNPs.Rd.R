library(WhopGenome)


### Name: vcf_countSNPs
### Title: Count how many entries in the selected region
### Aliases: vcf_countSNPs vcf_countBiallelicSNPs

### ** Examples

	##
	##	Example:
	##
	vcffile <- system.file( "extdata" , "ex.vcf.gz" , package="WhopGenome" )
	vcffile
	vcffh <- vcf_open( vcffile )
	vcffh
	vcf_countSNPs( vcffh )



